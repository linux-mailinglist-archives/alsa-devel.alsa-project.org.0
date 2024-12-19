Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F399F73B1
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 05:23:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A087D601FA;
	Thu, 19 Dec 2024 05:23:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A087D601FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734582196;
	bh=8APFJlVugmGaG41UhZJaxGBv+wc0SWzr3vlf3cYAeoc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=P1uUaUrXlFnmLJ8tkQwCYF4MwatA2GmJrLbBlst131KMmXPkvLQc4gL5vH4Pq1luL
	 Pg8ya4BnmWF9pwM6KZ+cbUYfjxpBmuhH6XPwHxP96NXuI/ImTcQ3ttgwb8xJT+8e+4
	 Iod+7bKoMd5nmgdPYMu4vuV7Ou4cHLWWJmkawYYw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D332F805B4; Thu, 19 Dec 2024 05:22:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16788F805B5;
	Thu, 19 Dec 2024 05:22:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26AF0F8020D; Thu, 19 Dec 2024 05:22:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from send219.i.mail.ru (send219.i.mail.ru [95.163.59.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EAF8EF800B0
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 05:22:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAF8EF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=ZrgJNPXA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=AjEIRJC3Is1bLGnw2833vNMwqkuOGVFndyuTj9mTugI=; t=1734582152; x=1734672152;
	b=ZrgJNPXAkXM4umYbsUXD/cZVegUsXiDXltc48I92FROfw85G6G7/zh7CYgcLo3knckQbRJXEtpc
	KMB5XJNUgkpw0njnYzKU5A4ejC9EWllUa77IIb8zBKfuLIi1cqLeOzAkFB0q66qdREJuzfBBlgVS5
	kutvaZMTufV14glU7/PNM5M5UDeNw/0nr4Cvh+/ZGI5XXul5UqpTs3aqE7yzzVkd7Qkcf9Q6LQaGm
	IX8xKsNck+S6Jg2Bn+TmMv7BHmaiWw/mxvNLtAl9ClnjSY3tPCpxT9lfewQKc/4NaREeNPa/c1dgh
	821rS9b+LrellV6zbKoBuNtamwt/n86XHWrg==;
Received: by exim-smtp-cc4f974bf-662z5 with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1tO83S-00000000GB2-2xlm; Thu, 19 Dec 2024 07:22:31 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: andy.shevchenko@gmail.com,
	u.kleine-koenig@pengutronix.de,
	tiwai@suse.com,
	perex@perex.cz,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	Maxim Kochetkov <fido_max@inbox.ru>
Subject: [PATCH v2 1/1] ASoC: codecs: nau8824: fix max volume for Speaker
 output
Date: Thu, 19 Dec 2024 07:22:27 +0300
Message-ID: <20241219042227.7075-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: exim-smtp-cc4f974bf-662z5;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 
 4F1203BC0FB41BD927BF2C9B6389F95E798FA003F3AC4E174E81B70A339AA402182A05F5380850404C228DA9ACA6FE279CAB95BD2DBD6D243DE06ABAFEAF67052942474733F93CE4029960CA417AE6C283EA1B0D5B4973F7
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE79B5CC362CEDE941CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006376F978168E59B07A5EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BC08E230531AC9C903B177BE24D85C3D2646B385410958285AEA615C3C489F0421DF9E95F17B0083B26EA987F6312C9EC9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B5278DA827A17800CE7A6779F98BF527B7A9FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C3ED8438A78DFE0A9E117882F4460429728AD0CFFFB425014E868A13BD56FB6657E2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407978DA827A17800CE773BC869C69ECC1572DBA43225CD8A89F83C798A30B85E16B156CCFE7AF13BCA4B5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 
 0D63561A33F958A5737E5AABD7B84C515002B1117B3ED6966E106937FF1B6DB133EE06AFCD964888823CB91A9FED034534781492E4B8EEAD2B25D9E4C92BC8ACC79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF9F4F15B0C9885B4780BDE15F42A7988A481D36E7F87C7C0573C114E1A005838735D245DF744597F124A398DE2C7926ED77942611A52FD2AD5655F8DB286B12E7535A8F4ACF0DB1654759C7B6195DDAFE02C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojHq2Ii2MsWRvfAsuL8sgd5w==
X-Mailru-Sender: 
 689FA8AB762F739381B31377CF4CA219CB5E8C623EB91606C93EF268E953C7B17402DBBBFF79AA3A90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Message-ID-Hash: X7AH4U3MJUDMM3BSXNFVJFTTURWLDF3W
X-Message-ID-Hash: X7AH4U3MJUDMM3BSXNFVJFTTURWLDF3W
X-MailFrom: fido_max@inbox.ru
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X7AH4U3MJUDMM3BSXNFVJFTTURWLDF3W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is no audio output if Speaker volume is set above 25.
According to datasheet Rev 2.5 maximum allowed value for the
Speaker output is 0b11001 (25)

0x6D CLASSD_GAIN_1/ 0x6E CLASSD_GAIN_2:

Left/Right Channel Class-D Driver Gain For DAC Left/Right
Input
(Step size is 1dB.)
00000 = Mute (DEFAULT)
00001 = 0dB
00002 = 1dB
...
11000 = 23dB
11001 = 24dB

So adjust this value in accordance with the datasheet.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 sound/soc/codecs/nau8824.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 12540397fd4d..5aaf8c496300 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -368,13 +368,13 @@ static const struct snd_kcontrol_new nau8824_snd_controls[] = {
 	SOC_ENUM("DAC Oversampling Rate", nau8824_dac_oversampl_enum),
 
 	SOC_SINGLE_TLV("Speaker Right DACR Volume",
-		NAU8824_REG_CLASSD_GAIN_1, 8, 0x1f, 0, spk_vol_tlv),
+		NAU8824_REG_CLASSD_GAIN_1, 8, 0x19, 0, spk_vol_tlv),
 	SOC_SINGLE_TLV("Speaker Left DACL Volume",
-		NAU8824_REG_CLASSD_GAIN_2, 0, 0x1f, 0, spk_vol_tlv),
+		NAU8824_REG_CLASSD_GAIN_2, 0, 0x19, 0, spk_vol_tlv),
 	SOC_SINGLE_TLV("Speaker Left DACR Volume",
-		NAU8824_REG_CLASSD_GAIN_1, 0, 0x1f, 0, spk_vol_tlv),
+		NAU8824_REG_CLASSD_GAIN_1, 0, 0x19, 0, spk_vol_tlv),
 	SOC_SINGLE_TLV("Speaker Right DACL Volume",
-		NAU8824_REG_CLASSD_GAIN_2, 8, 0x1f, 0, spk_vol_tlv),
+		NAU8824_REG_CLASSD_GAIN_2, 8, 0x19, 0, spk_vol_tlv),
 
 	SOC_SINGLE_TLV("Headphone Right DACR Volume",
 		NAU8824_REG_ATT_PORT0, 8, 0x1f, 0, hp_vol_tlv),
-- 
2.45.2

