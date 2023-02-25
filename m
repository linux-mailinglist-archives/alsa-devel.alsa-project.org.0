Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 421576A3DCC
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Feb 2023 10:06:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FF3E843;
	Mon, 27 Feb 2023 10:05:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FF3E843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677488787;
	bh=/cQ431sOJOitpGotRR92fWA1t2r28MwgRh9tgHYdq8g=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=o4Mn67ES/IkXbl3z69mZSAOFQFAcOPFs0k1rmQ5LbFGHOgBskr1oJvHDprtdDO0rM
	 02DzaFOn8WQK3YVuHhZAj9XzwIUhGd3ftMYeNgisKqfY6c4CiXft1mvITJj6XTrMBK
	 dxkn0L1sg+P9nUQ42CMVH7Fzz7gQ1xh5DgZpFyNE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC507F8052D;
	Mon, 27 Feb 2023 10:04:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D83DBF80125; Sat, 25 Feb 2023 19:44:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp32.i.mail.ru (smtp32.i.mail.ru [95.163.41.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A9C2F800DF
	for <alsa-devel@alsa-project.org>; Sat, 25 Feb 2023 19:44:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A9C2F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=mail.ru header.i=@mail.ru header.a=rsa-sha256
 header.s=mail4 header.b=DpXQ1As+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=+SVHyggOJAXOkCGWEwoFid2VStygqD2PmQkhU/cgNJ8=;
	t=1677350650;x=1677440650;
	b=DpXQ1As+EyGY7xMf9xUDaCbTHW8WGDcYtjZrwcbqnVO2PmcrTZ4sWgndaFleAqqKWLawjeowVgFmoCN6+uX6uatdy7iULnW4DaigjMY43Ua9Z+Zinfq79iy4aLKSsTirG1o6CJgQ32HHs14TvSarARMlV6HGLYL4biC5ASM/RhzGNyvJfnGicKcmsarlx8M4zWJHrNGNWr0HQ6Fdo5x0wAemBXER3pWsr4h6NDcjwLHYMZ9YiS+9XzHIRT0si6uqF3twtET3si+CgvdSlTvHWQyVDznSzU9Yd7MIEMeOYasguZWHaAdgL1x8txNW+J6CT7WWqSMMtK9/Y5H0jUKfcQ==;
Received: by smtp32.i.mail.ru with esmtpa (envelope-from
 <fomindmitriyfoma@mail.ru>)
	id 1pVzWg-00Gb09-Rx; Sat, 25 Feb 2023 21:44:07 +0300
From: Dmitry Fomin <fomindmitriyfoma@mail.ru>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 1/2] ALSA: ice1712: Do not left ice->gpio_mutex locked in
 aureon_add_controls()
Date: Sat, 25 Feb 2023 21:43:21 +0300
Message-Id: <20230225184322.6286-1-fomindmitriyfoma@mail.ru>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp32.i.mail.ru;
 auth=pass smtp.auth=fomindmitriyfoma@mail.ru
 smtp.mailfrom=fomindmitriyfoma@mail.ru
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 
 4F1203BC0FB41BD9806C989EC2150E33C13C456498AA74328729F4FEF7F411FF182A05F53808504033AAAE0726C56F16331896E9A51F74222811A8ADC78326F51A51D428B884B608
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE75840EB8CDBC1001FEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063748744D4CD6EC491D8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D89EC3D66F21EED5AB526FC6B071DC2B136F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7328B01A8D746D8839FA2833FD35BB23D9E625A9149C048EE9647ADFADE5905B1BDFBBEFFF4125B51D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B07CB022245CAE856389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F79006371668ED4911B0FC8BD81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE72ECDCBE77879C1BDEC76A7562686271ED91E3A1F190DE8FD2E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C37C6C241D9975906435872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 
 0D63561A33F958A5FB16B92C4FB9DA8B228B4F7132AA19AAD1565FE801DD37014EAF44D9B582CE87C8A4C02DF684249C2E763F503762DF50F2237FE565727C05
X-C8649E89: 
 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3475AE8838CC1BF58E3569D1E0318C65E6D56B877276685904F273E15A90B83A804D38885EFCD0ECAB1D7E09C32AA3244C941EA7C31609A35F71A0D9ABC07956E0F26BFA4C8A6946B88D5DD81C2BAB7D1D
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojEITt8lw84meLaXSAxMVtxw==
X-Mailru-Sender: 
 5C3750E245F36200A6D18CED7D1071013E214C08E0B704BA3C7BCD20960ADBDAC5AC0816EEA6E42AAA53FFDDC28CFB2AE047E8EF59C4A8C5CB2BD3896A7551E65350DE7942F9BA8DF4CD7D804643C5AF3E90D834D112973461E9E6D348337FCC993B91D010849960EAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-MailFrom: fomindmitriyfoma@mail.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FXLKSH66KXOHJSLPFBJE5R2A3GYEA5SW
X-Message-ID-Hash: FXLKSH66KXOHJSLPFBJE5R2A3GYEA5SW
X-Mailman-Approved-At: Mon, 27 Feb 2023 09:04:45 +0000
CC: Dmitry Fomin <fomindmitriyfoma@mail.ru>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FXLKSH66KXOHJSLPFBJE5R2A3GYEA5SW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If snd_ctl_add() fails in aureon_add_controls(), it immediately returns
and leaves ice->gpio_mutex locked. ice->gpio_mutex locks in
snd_ice1712_save_gpio_status and unlocks in
snd_ice1712_restore_gpio_status(ice).

It seems that the mutex is required only for aureon_cs8415_get(),
so snd_ice1712_restore_gpio_status(ice) can be placed
just after that. Compile tested only.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Dmitry Fomin <fomindmitriyfoma@mail.ru>
---
 sound/pci/ice1712/aureon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/ice1712/aureon.c b/sound/pci/ice1712/aureon.c
index 9a30f6d35d13..40a0e0095030 100644
--- a/sound/pci/ice1712/aureon.c
+++ b/sound/pci/ice1712/aureon.c
@@ -1892,6 +1892,7 @@ static int aureon_add_controls(struct snd_ice1712 *ice)
 		unsigned char id;
 		snd_ice1712_save_gpio_status(ice);
 		id = aureon_cs8415_get(ice, CS8415_ID);
+		snd_ice1712_restore_gpio_status(ice);
 		if (id != 0x41)
 			dev_info(ice->card->dev,
 				 "No CS8415 chip. Skipping CS8415 controls.\n");
@@ -1909,7 +1910,6 @@ static int aureon_add_controls(struct snd_ice1712 *ice)
 					kctl->id.device = ice->pcm->device;
 			}
 		}
-		snd_ice1712_restore_gpio_status(ice);
 	}
 
 	return 0;
-- 
2.37.2

