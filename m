Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D5B60AE04
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 16:45:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3610F7490;
	Mon, 24 Oct 2022 16:44:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3610F7490
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666622745;
	bh=qj8Xn9uB1LYYuXnd5MrDQPrA7Oqlsb5m3B3hu0dcuK8=;
	h=Date:To:From:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r8qDKvV23pFW0O1OC85dYlXa97Ij3DdzDpxzcM4NAxjLiErGS3tTpyKwGQTqIyRAS
	 mhyhuAp2NZiDu95pREUT2k2E6sxXzYU1ZlsBEj887gI249XUnMxnKxw67GL9aUX53n
	 ICjh2JLX/sefT1b7Nq3LcsDrNptWo+GxMSTCm+dU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A484F8052F;
	Mon, 24 Oct 2022 16:44:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 823FAF800B5; Fri, 21 Oct 2022 08:34:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=FORGED_MUA_MOZILLA,
 RCVD_ILLEGAL_IP,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EE47F800B5
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 08:34:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EE47F800B5
X-QQ-mid: bizesmtpipv602t1666334073tg8l
Received: from [127.0.0.1] ( [255.102.133.9]) by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 21 Oct 2022 14:34:32 +0800 (CST)
X-QQ-SSF: 01000000000000B0O000000A0000000
X-QQ-FEAT: wReDU7nm/Q2cX418S7HgcoF6AC1h4+/48kLxk6q0wPna4z/8BeGsMjegOnN6Q
 xpeZP2AcOu5Rawh1IrIeh6uCyHJWIvOdGaaCWoqFBNQuUjt1QUrA/jXbU0DlKrWwX6ewgvY
 0yJbkgsLZ5vrMMLbIEqaOcQ8NasGnEBNzyoYR5wGGFqBrJrvYGu1HNeYuIyyQv75p4v0Ksm
 M3pvf6gXGUfqmWU/qkE8JgBM9B0IAGlKKUr5ZYIhXedZHC7YzZfU7/zysEbLass1pBMPZq4
 ukfTGE7FQRkMQhJgxwOdxfnipGj4vEYpG6eCchAGu0HpXjdhuxTLjpKk54UVi40Jt44/59x
 cUFFAufuuFND3UP9m1TtpekTpVYPw==
X-QQ-GoodBg: 0
Message-ID: <26B141B486BEF706+313d1732-e00c-ea41-3123-0d048d40ebb6@leohearts.com>
Date: Fri, 21 Oct 2022 14:34:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Leohearts <leohearts@leohearts.com>
Subject: [PATCH] ASoC: amd: yc: Add Lenovo Thinkbook 14+ 2022 21D0 to quirks
 table
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpipv:leohearts.com:qybglogicsvr:qybglogicsvr5
X-Mailman-Approved-At: Mon, 24 Oct 2022 16:44:48 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Lenovo Thinkbook 14+ 2022 (ThinkBook 14 G4+ ARA) uses Ryzen
6000 processor, and has the same microphone problem as other
ThinkPads with AMD Ryzen 6000 series CPUs, which has been
listed in https://bugzilla.kernel.org/show_bug.cgi?id=216267.

Adding 21D0 to quirks table solves this microphone problem
for ThinkBook 14 G4+ ARA.

Signed-off-by: Taroe Leohearts <leohearts@leohearts.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 2cb50d5cf..c8df5c25e 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -45,6 +45,13 @@ static struct snd_soc_card acp6x_card = {
 };
 
 static const struct dmi_system_id yc_acp_quirk_table[] = {
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21D0"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.37.2


