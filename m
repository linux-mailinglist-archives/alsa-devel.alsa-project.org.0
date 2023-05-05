Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C54F66FA163
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 09:47:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B932912C7;
	Mon,  8 May 2023 09:46:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B932912C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683532069;
	bh=5+yooDIHmUf14+/PUOE0TB29m0xtQrb4HrKDN6WWEvE=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=lEaGDNgBLpBkMUW1nmvRIkcVtDCpORjZs4YArBukYjRPQeBcLh8vMEWC62lR9z3ip
	 JLtBYH4qZa5+hiYnwebolMKe6N95tA2/IzNUgvTNFeME3xRyQMHO/u2XnXCQlLHpcx
	 9sqLHJmnY+Wd1p2ShYZ+BjP6NqF7JFit1BqJCogA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD166F805AB;
	Mon,  8 May 2023 09:45:16 +0200 (CEST)
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/1] ASoC: dwc: extend supported formats
Date: Fri,  5 May 2023 08:35:21 +0300
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Mon, 08 May 2023 07:45:12 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OMCOQ6GV247HIMVJSZ5XFQZBCFUJUTZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168353191544.26.10932430736777909155@mailman-core.alsa-project.org>
From: Maxim Kochetkov via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, u.kleine-koenig@pengutronix.de,
 Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D64A6F8052D; Fri,  5 May 2023 07:36:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45107F80520
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 07:35:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45107F80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=ktH6z2pC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=iB4veIE04qlq+o6e8JdPfI+S36A1iZyRUb8yqoc1RPU=;
	t=1683264926;x=1683354926;
	b=ktH6z2pCWgc/SP7YpK7t1wy3rma+s+mOPhC2+JTIEhhLI2A3e4RipuUU9pGnAHay+IUBYcuXy1hbldfpilRTY//5pLwwDoBtB+ijJHM+F/BW5GzyqhrDm5+3zSOQkR6USQQIYjWEacccPmEdSv+ryjMAP6KsaF5Oo2uuVO9LdOAeYm5dgsqXCYyQsKhT9gjVPM/tKb4MZ54TkMu+gvS1WfGvhtH0XG4j6HSS2y5aLCLz84rQ5V/AWt36V9mQFESnW/XiOOSiJKJn2NxoYzzpgqajTzyJa5e9R9D9rVp2OgNotp+KXrKljYPISAKJZKNcZaxYIYQoFOhAk6FcgdiAQQ==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1puo6F-000568-Dt; Fri, 05 May 2023 08:35:23 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/1] ASoC: dwc: extend supported formats
Date: Fri,  5 May 2023 08:35:21 +0300
Message-Id: <20230505053521.18233-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 
 4F1203BC0FB41BD9C20EA97715EAF8CF12914BC8161E7FAEBC06EA0E3DEA8393182A05F538085040F0C7F744115303847D0E05FA629826BE224241915F72843130E24F1DDEAEC03E
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE75C861DE789AAB134EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B84F9009663064BD8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D802EB1F2133D70E6179F86CF651ABB5146F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7934314F73869482B9FA2833FD35BB23D9E625A9149C048EECCD848CCB6FE560CE5D25F19253116ADD2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B4AFB60FD1831C04CA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249D082881546D93491E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6E65F1423C7F32903089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 
 0D63561A33F958A5AA53C095C839A22718381EA27369C64BE4DD6423920E207EF87CCE6106E1FC07E67D4AC08A07B9B062B3BD3CC35DA5889C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A0997E3FB2386030E77
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF191CF55CFBE191A95C10028AC61AA2B7E9884F261DA6A03A7433C1C9C65F6F5F265F63FF884E79B314EE98CD8E9D35FCD014637F4AC7B58D6EFA560FE5F33D21FF926C0F406FFAF7
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojAeDCk4EFldEdjwcLGy5RqQ==
X-Mailru-Sender: 
 689FA8AB762F73933AF1F914F131DBF5AA9918DF0B7E4A009A5E1FF6ADF1D2A598CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-MailFrom: fido_max@inbox.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OMCOQ6GV247HIMVJSZ5XFQZBCFUJUTZK
X-Message-ID-Hash: OMCOQ6GV247HIMVJSZ5XFQZBCFUJUTZK
X-Mailman-Approved-At: Mon, 08 May 2023 07:45:12 +0000
CC: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, u.kleine-koenig@pengutronix.de,
 Maxim Kochetkov <fido_max@inbox.ru>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OMCOQ6GV247HIMVJSZ5XFQZBCFUJUTZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The COMP1_TX_WORDSIZE_0/COMP2_RX_WORDSIZE_0 fields in the comp
registers indicate the maximum wordsize supported. DWC I2S controller
can operate with any smaller wordsize. So extend the formats to let
I2S to operate in any allowed modes.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 sound/soc/dwc/dwc-i2s.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index acdf98b2ee9c..1f782752ea0b 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -480,9 +480,9 @@ static const u32 bus_widths[COMP_MAX_DATA_WIDTH] = {
 static const u32 formats[COMP_MAX_WORDSIZE] = {
 	SNDRV_PCM_FMTBIT_S16_LE,
 	SNDRV_PCM_FMTBIT_S16_LE,
-	SNDRV_PCM_FMTBIT_S24_LE,
-	SNDRV_PCM_FMTBIT_S24_LE,
-	SNDRV_PCM_FMTBIT_S32_LE,
+	SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
+	SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
+	SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE,
 	0,
 	0,
 	0
-- 
2.39.2

