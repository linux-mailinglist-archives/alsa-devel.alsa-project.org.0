Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B6131CA07
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Feb 2021 12:44:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0652E850;
	Tue, 16 Feb 2021 12:43:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0652E850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613475859;
	bh=8sZNdV4cg97yEkuOGTE5w6ZkiGds78ouwihOxWlrygQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U4PU0/sqUVFL8mueQ1wCFVjIF1RgVLt79+8f0vRgYvU17KnW6IfauOKXKu6pzDVNy
	 MRCJYwtbm8umyd/1r1LsJAitE6bnkwOlMAIo/Dh6f+LnLOcx354EivymvPna5Hb7VU
	 1+bs5sX/pPcUwrSQHoHD5tU7LUZMM/kf0UDywXNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EA28F8016E;
	Tue, 16 Feb 2021 12:42:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74EE0F8015A; Tue, 16 Feb 2021 12:42:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from smtp36.i.mail.ru (smtp36.i.mail.ru [94.100.177.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E564FF800AE
 for <alsa-devel@alsa-project.org>; Tue, 16 Feb 2021 12:42:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E564FF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mail.ru header.i=@mail.ru
 header.b="VxbbJvKn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=3eydGaa+AUT8ClxDNIc3qlOGpA9fqHbZyux95XxUj38=; 
 b=VxbbJvKnm7p9G8I8vLExQf8N/ScXyQW59N/TyJGjm2GMmMXIvWSvqR6j4Zvtjawpy3+CYBGGbd63Qs2ZnXXgmZ+DBBv+v3zs34sAX73AG48d1N2OUmUxp2mQZT1rUyCo6rOJJhndH/CxrSatoNvPXgUCoYwYdkCQnx2z5rLKwo4=;
Received: by smtp36.i.mail.ru with esmtpa (envelope-from <shc_work@mail.ru>)
 id 1lBykV-0002Bj-Cd; Tue, 16 Feb 2021 14:42:35 +0300
From: Alexander Shiyan <shc_work@mail.ru>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_ssi: Fix TDM slot setup for I2S mode
Date: Tue, 16 Feb 2021 14:42:21 +0300
Message-Id: <20210216114221.26635-1-shc_work@mail.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp36.i.mail.ru; auth=pass smtp.auth=shc_work@mail.ru
 smtp.mailfrom=shc_work@mail.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD91883A1EE8D2E9932D86E34B57BE2BEB9CE9F487DD0E8F8BD182A05F53808504089330414A48E23739B10878FD40C6856D6A0A3A97931950AEE2FDFCE0F7EADD1
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE723628CE20AC63995EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637CA870F47FB69F4AC8638F802B75D45FF5571747095F342E8C7A0BC55FA0FE5FC568B8A508022AC072CECC62F5338E713FFF64394D923784A389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C091DAD9F922AA71188941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B6A50BD5087FBFCDAACC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB8D32BA5DBAC0009BE9E8FC8737B5C22496CE449B29A2285B576E601842F6C81A12EF20D2F80756B5F7E9C4E3C761E06A776E601842F6C81A127C277FBC8AE2E8B08147ECF345C27FD3AA81AA40904B5D9DBF02ECDB25306B2B25CBF701D1BE8734AD6D5ED66289B5278DA827A17800CE7E1BCFB2C0BE3F18967F23339F89546C5A8DF7F3B2552694A6FED454B719173D6725E5C173C3A84C3517C622C16A6DF10089D37D7C0E48F6C5571747095F342E857739F23D657EF2B6825BDBE14D8E702ABEDDA51113D120200306258E7E6ABB4E4A6367B16DE6309
X-B7AD71C0: AC4F5C86D027EB782CDD5689AFBDA7A24A6D60772A99906F8E1CD14B953EB46D49A455135583CE90355D89D7DBCDD132
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C1C18E6A7EDD591E6884066AFFC5B396830F7466882D7BE3B9C2B6934AE262D3EE7EAB7254005DCED1C8AEA1E975C27AC1E0A4E2319210D9B64D260DF9561598F01A9E91200F654B0D18C7F408F36097E8E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D348F9E8EBB462314874237747A33B6FACAF23856B9BEB63DA66439E42B185AADFEA819E5C3F80AB6651D7E09C32AA3244C0F39CBB4099CA3483D2DB0DC65D3BADBD9ADFF0C0BDB8D1FAD832FF50B3043B1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojiBTwj6noE5fSAZNjI8ni9A==
X-Mailru-Sender: 8261CADE3D3FA0B4C2F1292954F703E9AC464446052AF2F50AADDDA4E7D1D1F739F4245528BE05066B3B2BD4812BFD4DC77752E0C033A69E93554C27080790AB3B25A7FBAAF806F0AE208404248635DF
X-Mras: Ok
Cc: Alexander Shiyan <shc_work@mail.ru>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>
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

When using the driver in I2S TDM mode, the _fsl_ssi_set_dai_fmt()
function rewrites the number of slots previously set by the
fsl_ssi_set_dai_tdm_slot() function to 2 by default.
To fix this, let's use the saved slot count value or, if TDM
is not used and the slot count is not set, proceed as before.

Fixes: 4f14f5c11db1 ("ASoC: fsl_ssi: Fix number of words per frame for I2S-slave mode")
Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 sound/soc/fsl/fsl_ssi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 404be27c15fe..1d774c876c52 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -878,6 +878,7 @@ static int fsl_ssi_hw_free(struct snd_pcm_substream *substream,
 static int _fsl_ssi_set_dai_fmt(struct fsl_ssi *ssi, unsigned int fmt)
 {
 	u32 strcr = 0, scr = 0, stcr, srcr, mask;
+	unsigned int slots;
 
 	ssi->dai_fmt = fmt;
 
@@ -909,10 +910,11 @@ static int _fsl_ssi_set_dai_fmt(struct fsl_ssi *ssi, unsigned int fmt)
 			return -EINVAL;
 		}
 
+		slots = ssi->slots ? : 2;
 		regmap_update_bits(ssi->regs, REG_SSI_STCCR,
-				   SSI_SxCCR_DC_MASK, SSI_SxCCR_DC(2));
+				   SSI_SxCCR_DC_MASK, SSI_SxCCR_DC(slots));
 		regmap_update_bits(ssi->regs, REG_SSI_SRCCR,
-				   SSI_SxCCR_DC_MASK, SSI_SxCCR_DC(2));
+				   SSI_SxCCR_DC_MASK, SSI_SxCCR_DC(slots));
 
 		/* Data on rising edge of bclk, frame low, 1clk before data */
 		strcr |= SSI_STCR_TFSI | SSI_STCR_TSCKP | SSI_STCR_TEFS;
-- 
2.26.2

