Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A43E26A3DCD
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Feb 2023 10:06:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 172F3851;
	Mon, 27 Feb 2023 10:05:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 172F3851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677488789;
	bh=j47VDr04DO0/8CtscGVFQ+dGxLsbqNjXu4N6Eawcfns=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nYaJFfaCmbw9ml09jA9xgAayx+WzR5z2R9U806FYgIMCcTDk4+9K/TpMhgBMwTzGq
	 nqrR/hrLq2PHgVJgCRl7B/hc3C+57iFEjOvtwi1yp8gLvqc2WaU1y2O+X1nKY1oSIY
	 6+gKwu5GK4gHlqLAjRxXp577vXgn7ey9CNF4M2jY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5313EF8052E;
	Mon, 27 Feb 2023 10:04:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCDA6F80125; Sat, 25 Feb 2023 19:44:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp32.i.mail.ru (smtp32.i.mail.ru [95.163.41.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80F37F800DF
	for <alsa-devel@alsa-project.org>; Sat, 25 Feb 2023 19:44:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80F37F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=mail.ru header.i=@mail.ru header.a=rsa-sha256
 header.s=mail4 header.b=Ozj2/pYM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=iNjSXs1/pAI2/74XOyD7PBWqqCwksjLfgXSNEmVMZXc=;
	t=1677350692;x=1677440692;
	b=Ozj2/pYMEupGvnT6tjUBjK7vzCFMaDIPoDBPoA/Bd67teqSlXL8DLcD59UDGq5OOg497K8zAiLQPUwK+ptM355f0ZTF71chbplHrzKaeCbym9wdcAobr8rZ5D4J0zPeoSRyrKKm5IKFdKHGteOD2Bt7GNGDwEZX8LpNcleLDxVzPE4BmFRWUvFQWi3qWXj6qK9wNqoXNR7lla8jCT61W2Onr+sTYYtysAzEwTBfVTd2nbpFS9s/klLErC/1Oz2J2U5PAup6uwMxb3oJG9bZiy4t9eUz1Mf0Tbs/RbaQUvltynqYN7YxfyC8KN/I5/VmCnyu/QclsJhmLxHDIzvtjOg==;
Received: by smtp32.i.mail.ru with esmtpa (envelope-from
 <fomindmitriyfoma@mail.ru>)
	id 1pVzXO-00Gb09-EE; Sat, 25 Feb 2023 21:44:50 +0300
From: Dmitry Fomin <fomindmitriyfoma@mail.ru>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/2] ALSA: ice1712: Delete unreachable code in
 aureon_add_controls()
Date: Sat, 25 Feb 2023 21:43:22 +0300
Message-Id: <20230225184322.6286-2-fomindmitriyfoma@mail.ru>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230225184322.6286-1-fomindmitriyfoma@mail.ru>
References: <20230225184322.6286-1-fomindmitriyfoma@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp32.i.mail.ru;
 auth=pass smtp.auth=fomindmitriyfoma@mail.ru
 smtp.mailfrom=fomindmitriyfoma@mail.ru
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 
 4F1203BC0FB41BD94A31EA4B0797EF2E72E18A16E4E351571D10D7A4E1A7C577182A05F5380850404C228DA9ACA6FE2772FD89AFC1BD152604AD72DFEC20B72A596BB80F61077AB2EC6E566672E4BD32
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7544B1CCE26E01C74EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371DF52D98DC3592C48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D87AD58D5F9F375A8D483D9D6ECE6AC8696F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7A6779F98BF527B7A9FA2833FD35BB23D9E625A9149C048EE0AC5B80A05675ACDCB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BCF01C05423B8DB1BA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC816C0BE60F4BE6A73AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006376A29911348193673D81D268191BDAD3D3666184CF4C3C14F3FC91FA280E0CE3D1A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F890A246B268E114E6D8C47C27EEC5E9FB5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 
 0D63561A33F958A54C7D87F68171D30A228B4F7132AA19AA9BF48DDA06A8B4C74EAF44D9B582CE87C8A4C02DF684249C2E763F503762DF50F2237FE565727C05
X-C8649E89: 
 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D349FF8F8245A2FAA7B765DBEB7D7068BB28BD7841ADBD0D15FB1DA42271785A3B06EA05D50451ED2F31D7E09C32AA3244C8991D915C426C1936EAD3CD2928DDD87F522A1CF68F4BE058D5DD81C2BAB7D1D
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojEITt8lw84mdnaKL8vyrTVQ==
X-Mailru-Sender: 
 5C3750E245F36200A6D18CED7D1071012E5E7A86C4A45F003C7BCD20960ADBDAF8580613C06DCA7AAA53FFDDC28CFB2AE047E8EF59C4A8C5CB2BD3896A7551E65350DE7942F9BA8DF4CD7D804643C5AF3E90D834D112973461E9E6D348337FCC993B91D010849960EAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-MailFrom: fomindmitriyfoma@mail.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AAASHAWEEQQLXCZW4W7NWAHW2SEJI7XW
X-Message-ID-Hash: AAASHAWEEQQLXCZW4W7NWAHW2SEJI7XW
X-Mailman-Approved-At: Mon, 27 Feb 2023 09:04:49 +0000
CC: Dmitry Fomin <fomindmitriyfoma@mail.ru>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AAASHAWEEQQLXCZW4W7NWAHW2SEJI7XW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If the check (id != 0x41) fails, then id == 0x41 and
the other check in 'else' branch also
fails: id & 0x0F = 0b01000001 & 0b00001111 = 0b00000001.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Dmitry Fomin <fomindmitriyfoma@mail.ru>
---
 sound/pci/ice1712/aureon.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/pci/ice1712/aureon.c b/sound/pci/ice1712/aureon.c
index 9a30f6d35d13..aa24f826d91b 100644
--- a/sound/pci/ice1712/aureon.c
+++ b/sound/pci/ice1712/aureon.c
@@ -1895,10 +1895,6 @@ static int aureon_add_controls(struct snd_ice1712 *ice)
 		if (id != 0x41)
 			dev_info(ice->card->dev,
 				 "No CS8415 chip. Skipping CS8415 controls.\n");
-		else if ((id & 0x0F) != 0x01)
-			dev_info(ice->card->dev,
-				 "Detected unsupported CS8415 rev. (%c)\n",
-				 (char)((id & 0x0F) + 'A' - 1));
 		else {
 			for (i = 0; i < ARRAY_SIZE(cs8415_controls); i++) {
 				struct snd_kcontrol *kctl;
-- 
2.37.2

