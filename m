Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A54738272
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 13:55:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E1C2823;
	Wed, 21 Jun 2023 13:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E1C2823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687348505;
	bh=N/Ozz1SWcSYIwUSTA3fKiHIcowjVH0MJQ16D65rqdl0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oYq7UOjXWQSxQ0Yts5ZI0H0F39fj19Wdo45brBw9k13uaVaYP2c4l8U+uksQSyIEH
	 PDLfYZ7IuqfA5o45qMSdLdo+5BLISJ5EnmqJD9L8zB4penXcr7lj7xObTkKD+CVncJ
	 tOfEq56Vr13wtPme1s4hMT8Vq+xpU4u0ZAyHt0tg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC8BBF801F5; Wed, 21 Jun 2023 13:53:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DF70F80132;
	Wed, 21 Jun 2023 13:53:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4367F80141; Wed, 21 Jun 2023 13:53:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A023F80093
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 13:53:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A023F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=Qh981oAE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=Dt0Pfw4hhB64UidxR15sPo8nXNsoSpkcj1h2rZuo8hk=;
	t=1687348423;x=1687438423;
	b=Qh981oAENONIOfSqU4A5/6Bb2jFxpt5X53BeVvyA+n2KCrPpyxADdBBYjRo7+evg9ES8RVzmWkuZ6wrCwJtzsh1CkZxEPNT5lSq566GE1nLF549TcR1C04DjIuEshqV2IV4xubEYHZbZUl+x3QdLvI8xS3RxB9PhQ87whRE4PVpq0L/YzZQsz+NmqUeAs05Uf5paLmX7PxtXquMSgZ5OJ5pMYo5PaJI9r5yIziZaG6ZfVwh6y18rwI/TbhXhENovCtiWNQ1Wha2d2zbGX+rKOtkzkZMQuh2qC77yDpXfJu3O8bnMsxgOQmCHfberhx3ap46rnncPtMugHIxiHoWTRA==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1qBwP5-0000gW-SZ; Wed, 21 Jun 2023 14:53:40 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: alsa-devel@alsa-project.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ASoC: codecs: max98090: Allow dsp_a mode
Date: Wed, 21 Jun 2023 14:53:27 +0300
Message-Id: <20230621115328.156457-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 
 4F1203BC0FB41BD95D99986233CC4DDC4468B86CD3C8787546E8D189E2EBE9EA182A05F53808504070B069C72436E1D2D5A4E71BD025E4125047B1DA41A3FADE443584DC68319CB8
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A140E7B1D51EB231EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006374D0D183F14C070BA8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D83712544A9697989658D127D5918B20866F9789CCF6C18C3F8528715B7D10C86859CC434672EE6371117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC3A703B70628EAD7BA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F4460429728776938767073520C24E1E72F37C03A0CB629EEF1311BF91D2E47CDBA5A96583BA9C0B312567BB231DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B67393CE827C55B5F775ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 
 0D63561A33F958A53ED0F0D15519928FD04AAF18DCFED2499590945C3EDE3FF3F87CCE6106E1FC07E67D4AC08A07B9B0A6C7FFFE744CA7FB9C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A0997E3FB2386030E77
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF874C60ACDD5FE242F57F3AD3431D0F7AB6867A931EA55A5E929DFB5A80A42D569B332213384B5353C17492877F82D9B86CE4D2ACC560A8F38AAD56CD3798406E04DA52CF61C1B8024C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojw7uTMtz3/lzKbCaM7tQQkw==
X-Mailru-Sender: 
 689FA8AB762F73930F533AC2B33E986B42AF639ED9E053B675404323CF2E7D5998CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Message-ID-Hash: PCJY36FCJBNMTVR76Y2TU3FOQ7AZWH4F
X-Message-ID-Hash: PCJY36FCJBNMTVR76Y2TU3FOQ7AZWH4F
X-MailFrom: fido_max@inbox.ru
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PCJY36FCJBNMTVR76Y2TU3FOQ7AZWH4F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

TDM mode for max98090 is dsp_a compatible. So allow it.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 sound/soc/codecs/max98090.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 7bc463910d4f..403926254c84 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -1635,7 +1635,7 @@ static int max98090_dai_set_fmt(struct snd_soc_dai *codec_dai,
 			regval |= M98090_RJ_MASK;
 			break;
 		case SND_SOC_DAIFMT_DSP_A:
-			/* Not supported mode */
+			break;
 		default:
 			dev_err(component->dev, "DAI format unsupported");
 			return -EINVAL;
-- 
2.40.1

