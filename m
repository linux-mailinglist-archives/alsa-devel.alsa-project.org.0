Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E832F30C2F1
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 16:08:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6798316ED;
	Tue,  2 Feb 2021 16:07:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6798316ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612278486;
	bh=chsoQVgOMFMKf0kMZfwuHu6gkK472skam4SXRssOxjg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c/w5Tc6anq8fPtQnu8H045wf8e1vf5TmMu8d/kpupyGEIrAXtBngvjPG4VZsJ3KjJ
	 JO7/vlnUxfMvwHRKQV9GgrxFvu9tpzapiU3+PrErvzMI5Zvs8dVE+aqz76r4ukacWz
	 J/TvYGoPQgZu60oCkXX7HCnEvrQxxXOPBTjOkj8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A718F800E1;
	Tue,  2 Feb 2021 16:06:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E96A5F801F7; Tue,  2 Feb 2021 16:06:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC4A0F8013C
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 16:06:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC4A0F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Msq5V5KO"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 73F0664DE1;
 Tue,  2 Feb 2021 15:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612278380;
 bh=chsoQVgOMFMKf0kMZfwuHu6gkK472skam4SXRssOxjg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Msq5V5KOil1YOd5y1SEB+Z57u8zhMrn3M0noU7iZn7FNmEVKEYxgSzDefdYqN+vQy
 H4dy9mFcgGkOix8T7Zabw1Gd0eRxhBLW7xs4pey8pAqFgTqNAhfphUVwS0RAK/9qoi
 GyMrdTMKMbaspajSdyJEi0G88yax1U9DP+LlRtzFIRlYeRN7zJr6N0mJFwlDh2pVaJ
 ilJPOqVXYWPYx94ZmMbkPSRlnZG99et4zKMuvIIiiWzLhca3Ac0k7NKxXuaft55x/M
 YHzB2ZfQxdcDI/G7Yl8Q+ITk9mdgKRajEsBhEc27KbiO0E7Tq8KuGZT1amCssaKNI/
 +W/O6Q+Vm/aHg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 03/25] ASoC: wm_adsp: Fix control name parsing
 for multi-fw
Date: Tue,  2 Feb 2021 10:05:53 -0500
Message-Id: <20210202150615.1864175-3-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210202150615.1864175-1-sashal@kernel.org>
References: <20210202150615.1864175-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
 James Schulman <james.schulman@cirrus.com>, Mark Brown <broonie@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
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

From: James Schulman <james.schulman@cirrus.com>

[ Upstream commit a8939f2e138e418c2b059056ff5b501eaf2eae54 ]

When switching between firmware types, the wrong control
can be selected when requesting control in kernel API.
Use the currently selected DSP firwmare type to select
the proper mixer control.

Signed-off-by: James Schulman <james.schulman@cirrus.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20210115201105.14075-1-james.schulman@cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm_adsp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index dec8716aa8ef5..985b2dcecf138 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -2031,11 +2031,14 @@ static struct wm_coeff_ctl *wm_adsp_get_ctl(struct wm_adsp *dsp,
 					     unsigned int alg)
 {
 	struct wm_coeff_ctl *pos, *rslt = NULL;
+	const char *fw_txt = wm_adsp_fw_text[dsp->fw];
 
 	list_for_each_entry(pos, &dsp->ctl_list, list) {
 		if (!pos->subname)
 			continue;
 		if (strncmp(pos->subname, name, pos->subname_len) == 0 &&
+		    strncmp(pos->fw_name, fw_txt,
+			    SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == 0 &&
 				pos->alg_region.alg == alg &&
 				pos->alg_region.type == type) {
 			rslt = pos;
-- 
2.27.0

