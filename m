Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A132B6FC
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 15:50:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 209DD173F;
	Mon, 27 May 2019 15:49:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 209DD173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558965029;
	bh=9JWpxorj30at6DDTjYilsB9SAGZyw3DCeh0yxPlSy/k=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lXzn4VsjG59yW7aYSkQ0XQk4lgV77VpCZZnbNe0tsRMnlfOT2NLIkNnZqFAJgn27s
	 GFSQfESVygpYneJgoP68pIR4WfqEBwlnO0/N8EeP/eGimATuPe7RNOKQuj0izFyg/U
	 aK1CIf8/ou9rBYQ51+DmHuaojZg732vKoiBYzETw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9813BF896E4;
	Mon, 27 May 2019 15:48:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6789F896E8; Mon, 27 May 2019 15:48:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, PRX_BODY_13, PRX_BODY_78, SPF_HELO_NONE, SPF_PASS,
 T_DKIMWL_WL_HIGH autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB320F8072E
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 15:48:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB320F8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="m2GaaM/s"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4RDm3H7012480;
 Mon, 27 May 2019 08:48:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1558964883;
 bh=sXYcD4XMlQBXTBpB0CQsMmBf9Lno5Nysqf8Tnwt8Cjk=;
 h=From:To:CC:Subject:Date;
 b=m2GaaM/spxeU5LaWXMCB+1hw3hKwko9mDalNCrSwdtKN1xrRhy6VxgMnqd5VaAKBf
 ibOYXUjCYhJF19tjI+wXHSGo+xkz7QR4Qu0i+vHFGkBIqFger4ftDQzSuAW/9tCxwe
 Q+kWWkQw1z2GJfCx5L7VCulFTAsfILDyQRxFuML8=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4RDm2bt095715
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 May 2019 08:48:02 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 27
 May 2019 08:48:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 27 May 2019 08:48:00 -0500
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4RDlviD065947;
 Mon, 27 May 2019 08:47:58 -0500
From: Jyri Sarha <jsarha@ti.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Date: Mon, 27 May 2019 16:47:51 +0300
Message-ID: <cover.1558964241.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: peter.ujfalusi@ti.com, a.hajda@samsung.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, robh@kernel.org
Subject: [alsa-devel] [PATCH v8 0/6] drm/bridge: sii902x: HDMI-audio support
	and some fixes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

I think these should be ready for applying to drm-misc.

Changes since v7:
 - Debased on top of the lasts drm-misc-next and tested
 - "dt-bindings: display: sii902x: Add HDMI audio bindings"
   - Dropped off "or higher to avoid conflict with video ports"
     and added "Reviewed-by: Rob Herring <robh@kernel.org>"

Ther previous round:
https://patchwork.kernel.org/cover/10919173/

Jyri Sarha (5):
  drm/bridge: sii902x: Set output mode to HDMI or DVI according to EDID
  drm/bridge: sii902x: pixel clock unit is 10kHz instead of 1kHz
  dt-bindings: display: sii902x: Remove trailing white space
  dt-bindings: display: sii902x: Add HDMI audio bindings
  drm/bridge: sii902x: Implement HDMI audio support

Tomi Valkeinen (1):
  drm/bridge: sii902x: add input_bus_flags

 .../bindings/display/bridge/sii902x.txt       |  42 +-
 drivers/gpu/drm/bridge/sii902x.c              | 488 +++++++++++++++++-
 2 files changed, 522 insertions(+), 8 deletions(-)

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
