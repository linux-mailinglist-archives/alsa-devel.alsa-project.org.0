Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD4189A89
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 11:54:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 944BB167A;
	Mon, 12 Aug 2019 11:54:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 944BB167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565603698;
	bh=jJACdRkg+KfBHjWmKbVvJvgK+ckIrw0/wPJ24pfJs0c=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mAsqnJ/pg62eXEbQmfRUmK201RA88xqOhhkVWRA5dvHjT6gYja/D+Uo4OBQ0/ffz+
	 9deSJZ8A1PSJMhDI6u+SZITkQb97LvVqURah0GCbsm5aI/sjmopebGcqomSngLu7zz
	 5F7PP0pphJzlgq52wOIsp12Oj4dwN3IencLQ6WpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56688F805A9;
	Mon, 12 Aug 2019 11:52:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42223F80214; Mon, 12 Aug 2019 11:52:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B785FF801EB
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 11:52:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B785FF801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZXCv7TzR"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7C9qGKm114315;
 Mon, 12 Aug 2019 04:52:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1565603536;
 bh=YGITip7GjyHjocLrS7YJyZGxRBGEnTaB1pLAKOMDQJA=;
 h=From:To:CC:Subject:Date;
 b=ZXCv7TzRA//7ltmBJoRalAmA+s+C/bZKXykKmuQrEDKVXq1ZWR+zOQvH3YpRLpuea
 9Nt27ECQ+kayhJcXqw8iqtGyCWjRQSqAXRjcsrCi6l/LjVuEUlM1FgkdMmn+ZlcQlQ
 U2+zKAX0ggiVG0tDBEOm0+IrbvxcSYujd4iWtOEw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7C9qG47106100
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 12 Aug 2019 04:52:16 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 12
 Aug 2019 04:52:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 12 Aug 2019 04:52:15 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7C9qDhP045058;
 Mon, 12 Aug 2019 04:52:14 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Mon, 12 Aug 2019 12:52:24 +0300
Message-ID: <20190812095226.18870-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] [PATCH 0/2] ASoC: pcm3168a: DAC/ADC independence and
	right_j fix
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

Hi,

The first patch makes sure that the DAC and ADC side of the codec can be used
and configured independently from each other.

The second patch allows the reconfiguration of tdm_slots and slot_width. It is
needed in case the codec is configured as slave and right_j whisch is the only
mode when it can support 16 and 24 bit audio, but 16 bit requires 16 slot_width
while 24 bit can use 48 or 32 slot_width. The codec driver must allow runtime
reconfiguration of the tdm_slots and slot_width for this purpose.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: pcm3168a: Retain the independence of DAC and ADC side of the
    codec
  ASoC: pcm3168a: Allow reconfiguration of tdm_slots and slot_width

 sound/soc/codecs/pcm3168a.c | 129 ++++++++++++++----------------------
 1 file changed, 50 insertions(+), 79 deletions(-)

-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
