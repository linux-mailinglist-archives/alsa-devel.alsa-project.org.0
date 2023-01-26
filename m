Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ACC67CD52
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 15:12:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C37AAEAF;
	Thu, 26 Jan 2023 15:11:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C37AAEAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674742369;
	bh=frcCV1k9oG9oKj3dpUqdJg1PxRT2RSN/XKdLCPjaYaY=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pVvpAL351Y9F1qXtFsohzuqUFUcv3g/sLYoPgqJ4wzzSRyDb5QEc0hB2WYLtulHjL
	 Iy7EE7k5iEhPS2jtPCzOLLNsbJTjCuoHqArmXb2N55614RdIhjkKeginQfwRjRteg+
	 ZNtoJ7QvegCwebwdzh23LF6o/VV34SajaOWQiODM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D133F800AE;
	Thu, 26 Jan 2023 15:11:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 606ABF8027D; Thu, 26 Jan 2023 15:11:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
 HTML_MIME_NO_HTML_TAG,MIME_HTML_ONLY,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0B4FF8016E
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 15:11:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0B4FF8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 secure) header.d=gmx.de header.i=@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=X/n6fg96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1674742300; bh=4ag8qqf0hgl6mi1tK1y0Sa/qXyqvkCGeCvesphSWnbQ=;
 h=X-UI-Sender-Class:Date:Subject:From:To;
 b=X/n6fg96z5s8//ILNdqGA7OMsuJIq5xPVDeZEUvCS48ZpWmRiBxDUvGJW/8OnZ4Ci
 ekkDO6L+MZEpqWH5Mx8jXzFqDReOXD6IDV5tZDP7CJF3aVCMNFTuP3CnX8dmuzmZHm
 Uwobk8p1fstzPBFWRO8CYaIYqN1JKdRAg9d/Oi7auaE/Js6wzUbz0KS22l3XPhcjxz
 SXDT6C0LB71VD13AYehnIG+Hjz7kM7npeoKzjsd1Y7OQboEkze4vz9ZZ2OBmnbJc4p
 V9tA9zAlXlnyOFOc+GV8flgrELAkjXZVWEilPdGxTOeZxZ4BtJaPZNJ9b2KyhcBJYy
 e8pz2uxF9ej9w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.66] ([77.20.255.105]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1fii-1ofCvz3lwu-011vtF for
 <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 15:11:40 +0100
Date: Thu, 26 Jan 2023 15:11:38 +0100
Subject: Firewire Motu ALSA (Re-post) 
X-Priority: 3
Message-ID: <v6inx6-fwmr0r-kvajcd-kfs8u9l6m2qn2cnogd-2odpkz-d7vadu94fw76-iv1ohfsnh0nxdhq3hl-irmx6t-3alyitjtt3oq-m2jt5z8uktj3-1khriq-w6pr0c-bitxl26qa5mx-sc4dcno22ycq-2x7a4f.1674740730928@email.android.com>
From: "M. Armsby" <m.armsby@gmx.de>
To: ALSA mail List <alsa-devel@alsa-project.org>
X-Provags-ID: V03:K1:JWuWG2L/7VDBTvcrpd8S8G8yizzQ0X3Z7uW9OEwyP7yf4ZZS8Ll
 aIxfAm6KBJlJd/RxJ5t4rVCWwCWEPjsCgwSEkaj7jpM8KryVyS6vXvQrAWMrYaQlvqB80jX
 uYIw716dlflQhkMrxYdN3uPvWvk/9GV3OKtUkB2ximahQom2UT2JUEUTdmULmmdeaDppSzB
 ajXBvvqtXZRf9NDJ7qcQA==
UI-OutboundReport: notjunk:1;M01:P0:ouC/tkqZKgo=;SuMpjc2eIk538nE0g5YjppNU3QA
 hX84xQm4Wncx9V/exU4L1zpTp3jaIldI/618SW345WFe46OVuE/PsM9ILagXTCCAHbr/yaern
 F/UUwzgi3DaPZAns4kCxXYZrX5lsy5tsm9eCsM26MRH2hx35jrviwC3Hc4WiRbkV1L2QMzen8
 x3FCpPOTxEksmtd3+3knuSiK0iH/KsXxvrMcaXkHeVcGkUzDc5T45ek9AfSr6MmWy//rW6GOI
 vQOwWIvbi231ZFGx6ZzAp1vUj9ZBCian3SoDIgNefX54DfcIn/nO2M8h42W8xhycW6vtoA/Cs
 yZTOujI6igCeDDZfB79dCASVS8aB5ghG8Q9ROhRpKvJZvmVxTvjZrK5ysVilmQx/JLD9EvTnz
 66X5GeDHf0amcH48IRu7WZ9iAEJ9O1Nx7jD52I8aki0a2kYN3G+HqLdfsUctMWpMycf6zHNoD
 uRfFUea1HDxdesHsXVxYB5ypS6be06PtoZcx48wG6MIQznrNcNCRxnp0wxqEcrCe64BlOzdy2
 DbMFVCG/GfKhYl36PY+sBHjgiEmdi4elsuebqWuI2sZRDOUF4g7G3j2DMbZE1wCVvV1C3UHLk
 eEaMzAsgT9BE3O+ogwDHXQWkksqTjPx2MMukzTxJhmQ7lp9kcujKs6MnO76FyPWiEIRy+GV2T
 lWGuzM4o+C5kn+UmtcN3prKnXwKDkOCJgIfSvN0sL41yRU49gbCp187XQD4p6GoRcHpj87JMs
 IeOwZUPjfFOOBSzDPPmSlqHLLDiMJ9mYax1SBRrUVkJfy089dhJE8DgVgz1n1NTwXqfD/xAFA
 QnidIu08IAdDUwh4hHjI3I2gXNr8sz5ZbOExVPxPjty5f5dWezwAwq/tIlHckYHbC+Rob4tMM
 kuvE9PveMpTp0cfdSsbdPfaEQN6T+eRFm2znFEF4tYCKeSRIR132i/d6k5mRGdYjKwFecPTyc
 dL3ccg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

