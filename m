Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 734962DADAA
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 14:05:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E246A17E1;
	Tue, 15 Dec 2020 14:05:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E246A17E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608037557;
	bh=LUqkggOeSjLSKOGp0rhWWEwMIEZGbCJkoQz4KMNsg74=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iWG3Rk8dMVXExeUipz5iM8me2Ui+719nswPwgIxtP2IZAeFJKBdH0+xj2zw/zvm/r
	 /Y74EKeFmZDhuHm6aHP1OrJoI+asZ/gZLX1asLk4PdkUP6JXOhuR07znR2mgYblCHh
	 6QNuAH8Cjw6xMroZkZfH0OFMtK1JWqe/9ut6ed+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40393F8028B;
	Tue, 15 Dec 2020 14:04:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0256F8027B; Tue, 15 Dec 2020 14:04:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A64EF80121
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 14:04:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A64EF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="q0TGzEEA"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFD4Daa053244;
 Tue, 15 Dec 2020 07:04:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608037453;
 bh=HZc58tX62PwkKvPlgQQvf+b5yzUbad2EgN3Bk3JTNIc=;
 h=From:To:CC:Subject:Date;
 b=q0TGzEEAco3alyV3haiAPGByEdp8UidlsJJURNP+spsKK2IFMOo0w8F89Uw32RAGM
 3TXdGM/m6nuUsCZnSK/jZIdv0IQnetctiQYH7MbiTFJIN4koEnwiiyCzQvSaopMUPt
 Uj9eCeCUxaqFdkZ7NLafBaF5+Ypt0vigJsbicw2A=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFD4DQJ087758
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Dec 2020 07:04:13 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 07:04:12 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 07:04:12 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFD49vK024224;
 Tue, 15 Dec 2020 07:04:10 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <jarkko.nikula@bitmer.com>,
 <robh+dt@kernel.org>
Subject: [PATCH 0/2] ASoC: ti: Maintainer mail address change
Date: Tue, 15 Dec 2020 15:05:10 +0200
Message-ID: <20201215130512.8753-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, jsarha@ti.com, tiwai@suse.com,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Hi,

My TI address is going to bounce after Friday (18.12.2020), switch my email
address to my private one for now.

Regards,
Peter
---
Peter Ujfalusi (2):
  MAINTAINERS: Update email address for TI ASoC and twl4030 codec
    drivers
  ASoC: dt-bindings: ti,j721e: Update maintainer and author information

 .../devicetree/bindings/sound/ti,j721e-cpb-audio.yaml       | 4 +++-
 .../devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.yaml   | 4 +++-
 MAINTAINERS                                                 | 6 +++---
 3 files changed, 9 insertions(+), 5 deletions(-)

-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

