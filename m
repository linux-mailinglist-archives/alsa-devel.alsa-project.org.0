Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 059F162783A
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 09:56:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EBA11678;
	Mon, 14 Nov 2022 09:55:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EBA11678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668416201;
	bh=HIJbWkS+tWWtWnE/a8+wDKXpyw77gbIpOz9/BJOfd5c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U/hBaT4v1/+54+u1nXx1ym8CP7mJ5uxy8mbQZPgkSSHkcFubwdqoDbcPPW+C32Rhf
	 yf42OcA8p/Ubr/IUdOD+mf1bwnxPTWkAABZ26OyxZEKREYjzgud3uYBwc6BmY83+W8
	 z7/OyNkQOE/9kPBf+mIWc+SjzN9zZFWj158qdGyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2133EF80448;
	Mon, 14 Nov 2022 09:55:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D4FEF80431; Mon, 14 Nov 2022 09:21:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from forwardcorp1b.mail.yandex.net (forwardcorp1b.mail.yandex.net
 [178.154.239.136])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39F68F800B8
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 09:20:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39F68F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.b="02ALz6J6"
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id E11E45FDB9;
 Mon, 14 Nov 2022 11:20:54 +0300 (MSK)
Received: from d-tatianin-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:7220::1:21])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ZGx2Cxmcjr-KrOCHxjm; Mon, 14 Nov 2022 11:20:54 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1668414054; bh=L2zM4ynwcrgw1HSI6nofrGxwQPENAqtkdQBfFMezm1w=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=02ALz6J6s5aoVmH1wEoJIL066qf5uHWtFJNca7mf38HAHZ1SlCVXgZwpXBU4woBdc
 iJ8hpFDRPeZGilgWS5LUW6po9eE5ww3RacftF2GOiVuk7MAyg+LcaOIGEz+QLPP7IG
 5NpkXzlCGk5z4v0hiCQmLtq12HNhh6dCO8fKewVY=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v1] sound/pci/hda/patch_realtek: don't call alc_shutup_pins
 without a spec
Date: Mon, 14 Nov 2022 11:20:48 +0300
Message-Id: <20221114082048.3477027-1-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 14 Nov 2022 09:55:46 +0100
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
 lvc-project@linuxtesting.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 Meng Tang <tangmeng@uniontech.com>, Philipp Jungkamp <p.jungkamp@gmx.net>,
 Tim Crawford <tcrawford@system76.com>, Takashi Iwai <tiwai@suse.com>,
 Werner Sembach <wse@tuxedocomputers.com>, linux-kernel@vger.kernel.org,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, yc-core@yandex-team.ru,
 Daniil Tatianin <d-tatianin@yandex-team.ru>, alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alc_shutup_pins always expects the spec to be present, so make sure
it is before we call it.

Found by Linux Verification Center (linuxtesting.org) with the SVACE
static analysis tool.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 sound/pci/hda/patch_realtek.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 60e3bc124836..2cf4b64971d7 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -939,10 +939,12 @@ static inline void alc_shutup(struct hda_codec *codec)
 {
 	struct alc_spec *spec = codec->spec;
 
+	if (!spec)
+		return;
 	if (!snd_hda_get_bool_hint(codec, "shutup"))
 		return; /* disabled explicitly by hints */
 
-	if (spec && spec->shutup)
+	if (spec->shutup)
 		spec->shutup(codec);
 	else
 		alc_shutup_pins(codec);
-- 
2.25.1

