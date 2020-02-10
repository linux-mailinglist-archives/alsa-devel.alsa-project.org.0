Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 826DB157D0E
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 15:08:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D78D616A0;
	Mon, 10 Feb 2020 15:08:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D78D616A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581343734;
	bh=GGP815sKohAfoaew6PXS1iIL7EOl1q4GCsetSOT0y2w=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m0iEnyizEZ3FknkDxt66EdFVS3eJXgqENWSAyjd3v3shJlt9qTYs1SSC9/CT70kTO
	 /Y8tSm6H+8Jl9W8S/JIAgxbrUFS/fxRg7qG8eUtMQn3VSR/t+rJ5nCvQir3eEC5Wm2
	 TeD8vF1NSf/TNP8TwyHrY011G3R62yctSWPZ2VxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CA0DF80158;
	Mon, 10 Feb 2020 15:07:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0DC9F80157; Mon, 10 Feb 2020 15:07:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HTML_MESSAGE,PRX_BODY_135,
 SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9B54F800E7
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 15:07:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9B54F800E7
IronPort-SDR: oqRzx0lXeeEg1xEKCEYbiDRhMQnV5Z49laxCyJx2NwCuazksmSlX5zi8MiVa3XCa/ZrylOLCrN
 w5o7n7KijAOGquSqqcNOBbezUaBGD7DXl978dHmJcefftrJcJmMT3OJ3c0BI8LQmiYYIr1eFMZ
 a2rWx5gwUX6ZiaAoZbLmk2/aWELFPlMIcVsOd7ZhxEg1CNBZQD04Zb6qOQPiaMgYVtyXTeu1Dj
 BAzWGTxxGEZSHYZTYTuzhJ4IfWRhu0KKDIsfKOQtaEBGx/7Cn1LQlqT6+LtzAthf/gdf/Em+Zs
 Y/o=
X-IronPort-AV: E=Sophos;i="5.70,425,1574150400"; d="scan'208,217";a="45728364"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa4.mentor.iphmx.com with ESMTP; 10 Feb 2020 06:07:06 -0800
IronPort-SDR: e+6fzJfsFuKVrXa9NzyW694TluiUf9ZcyADi2utfT+DZo542CqLunYilpMaaP/Jbcydnn3jfjq
 cds0tSmNvH07eT/6/J5ebR7BBbdcHqYi8s897g0NteEI9/TrgqYJ+0oQSfPug2iYSI1EZ41VcI
 mBClLnPSkWCaX/aRj+MIvoUHAjdHfeQoSWokPszLDlrjZM6qqcwk2T3pzGVpEUX59onxPRmXal
 w8bvd+/rPh7oQ76AQ7t36MvmbGGw4vfU1BwirwIkHmes1Jb+s/TlAUOcAvVxOe1fub5cPdcu6b
 jTM=
From: "Sutar, Mounesh" <Mounesh_Sutar@mentor.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: unsubscribe mounesh_sutar@mentor.com
Thread-Index: AdXgG1n3oZ3XJwB4RHKD7NuvQL1qjA==
Date: Mon, 10 Feb 2020 14:07:01 +0000
Message-ID: <04d8373c32d842a899636399ab14a0a2@SVR-IES-MBX-04.mgc.mentorg.com>
Accept-Language: en-US, en-IE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] unsubscribe mounesh_sutar@mentor.com
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

unsubscribe mounesh_sutar@mentor.com
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
