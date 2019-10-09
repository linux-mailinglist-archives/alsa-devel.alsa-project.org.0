Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 274B3D53AE
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Oct 2019 03:12:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A29651673;
	Sun, 13 Oct 2019 03:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A29651673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570929143;
	bh=pUN/jlPGufE9UiOpddzrZTYzdrlMWlOFzQo3xoSPOnA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OdRIQvr7nvOnK2F7BGuca3grjhuFB32nDc5SAXN3Cbx9tVzjAcJUVLsteycq941oN
	 H1/22qu6c9TaTgoD+/mQxtvDDc8HoayfF3TKFopNC3ryrlZ8nTNI7rxTyxVdAV6m7I
	 KmPpJ3kbjO1EuJPzI3qWFPxMvuVWKg/ip+3kooAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81F15F8038F;
	Sun, 13 Oct 2019 03:10:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDEDAF8038F; Sun, 13 Oct 2019 03:10:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from listssympa-test.colorado.edu (listssympa-test.colorado.edu
 [128.138.129.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7721F8026F
 for <alsa-devel@alsa-project.org>; Sun, 13 Oct 2019 03:10:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7721F8026F
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=sirena.org.uk header.i=@sirena.org.uk header.b="fRSoG5IP"
Received: from listssympa-test.colorado.edu (localhost [127.0.0.1])
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/sympa) with ESMTPS id
 x9D1ATcu001514
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 12 Oct 2019 19:10:29 -0600
Received: (from root@localhost)
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/submit) id
 x9D1ATY4001496; Sat, 12 Oct 2019 19:10:29 -0600
Received: from DM5PR03MB2668.namprd03.prod.outlook.com (2603:10b6:a03:1b8::26)
 by BYAPR03MB4376.namprd03.prod.outlook.com with HTTPS via
 BY5PR17CA0013.NAMPRD17.PROD.OUTLOOK.COM; Wed, 9 Oct 2019 18:36:35 +0000
Received: from BL0PR03CA0020.namprd03.prod.outlook.com (2603:10b6:208:2d::33)
 by
 DM5PR03MB2668.namprd03.prod.outlook.com (2603:10b6:3:43::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
 id 15.20.2327.24; Wed, 9 Oct 2019 17:51:04 +0000
Received: from SN1NAM01FT048.eop-nam01.prod.protection.outlook.com
 (2a01:111:f400:7e40::202) by BL0PR03CA0020.outlook.office365.com
 (2603:10b6:208:2d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 17:51:04 +0000
Received: from ipmx4.colorado.edu (128.138.67.75) by
 SN1NAM01FT048.mail.protection.outlook.com (10.152.64.249) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
 id 15.20.2347.16 via Frontend Transport; Wed, 9 Oct 2019 17:51:04 +0000
Received: from ipmx7.colorado.edu ([128.138.128.233]) by mx.colorado.edu with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 11:09:49 -0600
Received: from ipmx4.colorado.edu ([128.138.67.75])  by mx.colorado.edu with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 10:32:49 -0600
Received: from mx-spsc.colorado.edu (HELO mx.colorado.edu) ([128.138.67.77]) by
 mx.colorado.edu with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2019
 10:13:09 -0600
Received: from vger.kernel.org ([209.132.180.67]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 10:00:39 -0600
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand id
 S1731661AbfJIQAi (ORCPT <rfc822; michael.gilroy@colorado.edu>);
 Wed, 9 Oct 2019 12:00:38 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:48268 "EHLO 
 heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by
 vger.kernel.org with ESMTP id S1729644AbfJIQAh (ORCPT       
 <rfc822; linux-kernel@vger.kernel.org>); Wed, 9 Oct 2019 12:00:37 -0400
Received: from 188.29.185.136.threembb.co.uk ([188.29.185.136]
 helo=fitzroy.sirena.org.uk)        by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)        (Exim 4.92)       
 (envelope-from <broonie@sirena.org.uk>)        id 1iIENy-00059v-Ow; Wed, 09
 Oct 2019 16:00:22 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000) id 97E72D03ED3; 
 Wed,  9 Oct 2019 17:00:21 +0100 (BST)
Authentication-Results: spf=none (sender IP is 128.138.67.75)
 smtp.mailfrom=vger.kernel.org; 
 o365.colorado.edu; dkim=fail (signature did not verify)
 header.d=sirena.org.uk;o365.colorado.edu; dmarc=fail action=none
 header.from=kernel.org;
Received-SPF: None (protection.outlook.com: vger.kernel.org does not designate
 permitted sender hosts)
Authentication-Results-Original: mx.colorado.edu;
 dkim=hardfail (signature did not verify
 [final]) header.i=@sirena.org.uk
IronPort-SDR: Hl6f2ZtiLuIF+rQKMULwM+EgB+Ryx6ziHOPUUU3ciNl0LOaFOeWCjIpOE2Rq/Iq2PtrNFdfEC4
 kz0ZnNqQCImHaBWuMf6LWRNqxWGUe6cnQ=
IronPort-SDR: PqJdTuDQm38lEZG9m2zdNx5N38A8JVslqiP7MISVTUkPgG0SyZs8CVrN1VdJkOV8a0YjH01WUK
 CpepJX2H1tHN2hCqIJM24d5Ozy/Hwb894=
IronPort-SDR: mDz7ZCgWiTykZ7fVqyHQyVu5YomHlIXNAXlKw6MovmrPGXkuR/z/+pa36lBnn9MrK88MQKcnI1
 iPEFNZwFXhLk0jJejGrV5NYis2LE2iRgA=
IronPort-SDR: 30sonFc9MBBnM8mFkLK4a5W7APGbeJ9SKpXVKYjOdjSsyoIGmXV7F+5jRCNO/+//q4LY0A2azs
 ourIyoBjr7ZfelQzD1BZr0FZvbQHmHeyg=
IronPort-PHdr: =?us-ascii?q?9a23=3AYUCLcxCO7VM+B6ZCdjcdUyQJP3V1l5bVG0s49J?=
 =?us-ascii?q?MjlrtSc6OloMW4blKKvKYlhQrTRoye8PJN0beI4Oj5DGAG+tGdoGxROJcZTR?=
 =?us-ascii?q?IBgNUbk0s6DcqMGUD3f5uIJ2RyVIwKHBdpqmq6K0VTEYD5fVKUv37hpSVHQE?=
 =?us-ascii?q?2malIlf7mwGoPWjsOsz+C/4ZCAKwUdpTz4W75qKATzkQKDnc4QnYZkNuMN2w?=
 =?us-ascii?q?PE8B4qM6wejSsgbRq2vjPRo/m95oVi9CICgf8v+tRNV673ZPYdQKdDBTsrdk?=
 =?us-ascii?q?EZtvb2vxvORhfdzXBObmJEvABPBlrp5Q33DKz8tCf3rLhH1TGeLIjKSuJRO3?=
 =?us-ascii?q?zqp+8jAFegoyABKzM/7CTrkMV2l6xWuleMoRd4z4/Sb9O+M/xic6XBOPI2F0?=
 =?us-ascii?q?FGWNpcUTAELo6nZJEOF/YAOuAKlYTmql0S6De3GQT+YYGngncAzje+lZc3yO?=
 =?us-ascii?q?knDUToxgslTegDq3nSsJDOOaEeXPrn9qTTwDPfKs9Riw3w84XOblUKqqO2UK?=
 =?us-ascii?q?l9d9aU7EQ0DArKgxCxhd7BPiiJk8UB4Q35p6IoHarnwyYDqhpt5xiiwt9+ro?=
 =?us-ascii?q?jSmscozEvZ/z5y2oc/KI+cSVVnJOW5GoBbrSCQOtlSQ9g+Bllvozpo7rwdpd?=
 =?us-ascii?q?ucYy4H0sYDxgXDLtWdeIiJ/B+wMYTZaX8wzDotMPq1h0OA8mWSw+DBeZOQ/H?=
 =?us-ascii?q?wVqTFuucvl60si3ECNrfSGFuVb0n+Ngmuohz6U9cx5dBN8n//VEaUm7eMRrr?=
 =?us-ascii?q?AMjUDNTmyxhVr7k6mfcWJ+n4rgo6yvKv2u7qekDqZvqRH0abo/luqzMOoRNx?=
 =?us-ascii?q?AWVEG32siD3rq/2hHYbpMVpfdplffGoMroFeVAjJG4QBRSwNsE6AyZBnCf2u?=
 =?us-ascii?q?wS3iMLAkt8ew2oj6zUXjOGaLiwRb/3y12XnDVUltLYIp3nBYn/CXv7zbawZ+?=
 =?us-ascii?q?tY8xBbyTZrlYB854JaNO89GMz+ZGDA5ez6DDYHFTKN2eziJNpn75sOCW+SPv?=
 =?us-ascii?q?C4P/aB+U/N5/goJfGLfpNQojvmNvw5sv7nl3M3kF4ZLuG5mJoNb3agGe56Zk?=
 =?us-ascii?q?iDe33218wAHmEDohckQaTmiVHKVzlPL2i/RaMy93kIBoOgBIP2Fdr30pWcwC?=
 =?us-ascii?q?e2GIFXbWlaC1eKVE3lbJiAR+xcOXCXMolqlTgDT7GtTMks2Qz9/AP5yr8yLu?=
 =?us-ascii?q?PO9iMRtJarlMN06OvaiQwo+HR4DsjV1WaRB395hGIGVncF0qF5qEhIix+D3K?=
 =?us-ascii?q?F0juYeFIl7/PJTXwEzc5nGwKpnCN0=3D?=
IronPort-PHdr: =?us-ascii?q?9a23=3AGWDSAxAqpLGUef/ily1/UyQJP3V1l5bVG0s49J?=
 =?us-ascii?q?MjlrtSc6OloMW4blKKvKYlhQrTRoye8PJN0beI4Oj5DGAG+tGdoGxROJcZTR?=
 =?us-ascii?q?IBgNUbk0s6DcqMGUD3f5uIJ2RyVIwKHBdpqmq6K0VTEYD5fVKUv37hpSVHQE?=
 =?us-ascii?q?2malIlf7mwGoPWjsOsz+C/4ZCAKwUdpTz4W75qKATzkQKDnc4QnYZkNuMN2w?=
 =?us-ascii?q?PE8B4qM6wejSsgbRq2vjPRo/m95oVi9CICgf8v+tRNV673ZPYdQKdDBTsrdk?=
 =?us-ascii?q?EZtvb2vxvORhfdzXBObmJEvABPBlrp5Q33DKz8tCf3rLhH1TGeLIjKSuJRO3?=
 =?us-ascii?q?zqp+8jAFegoyABKzM/7CTrkMV2l6xWuleMoRd4z4/Sb9O+M/xic6XBOPI2F0?=
 =?us-ascii?q?FGWNpcUTAELo6nZJEOF/YAOuAKlYTmql0S6De3GQT+YYGngncAzje+lZc3yO?=
 =?us-ascii?q?knDUToxgslTegDq3nSsJDOOaEeXPrn9qTTwDPfKs9Riw3w84XOblUKqqO2UK?=
 =?us-ascii?q?l9d9aU7EQ0DArKgxCxhd7BPiiJk8UB4Q35p6IoHarnwyYDqhpt5xiiwt9+ro?=
 =?us-ascii?q?jSmscozEvZ/z5y2oc/KI+cSVVnJOW5GoBbrSCQOtlSQ9g+Bllvozpo7rwdpd?=
 =?us-ascii?q?ucYy4H0sYDxgXDLtWdeIiJ/B+wMYTZaX8wzDotMPq1h0OA8mWSw+DBeZOQ/H?=
 =?us-ascii?q?wVqTFuucvl60si3ECNrfSGFuVb0n+Ngmuohz6U9cx5dBN8n//VEaUm7eMRrr?=
 =?us-ascii?q?AMjUDNTmyxhVr7k6mfcWJ+n4rgo6yvKv2u7qekDqZvqRH0abo/luqzMOoRNx?=
 =?us-ascii?q?AWVEG32siD3rq/2hHYbpMVpfdplffGoMroFeVAjJG4QBRSwNsE6AyZBnCf2u?=
 =?us-ascii?q?wS3iMLAkt8ew2oj6zUXjOGaLiwRb/3y12XnDVUltLYIp3nBYn/CXv7zbawZ+?=
 =?us-ascii?q?tY8xBbyTZrlYB854JaNO89GMz+ZGDA5ez6DDYHFTKN2eziJNpn75sOCW+SPv?=
 =?us-ascii?q?C4P/aB+U/N5/goJfGLfpNQojvmNvw5sv7nl3M3kF4ZLuG5mJoNb3agGe56Zk?=
 =?us-ascii?q?iDe33218wAHmEDohckQaTmiVHKVzlPL2i/RaMy93kIBoOgBIP2Fdr30pWcwC?=
 =?us-ascii?q?e2GIFXbWlaC1eKVE3lbJiAR+xcOXCXMolqlTgDT7GtTMks2Qz9/AP5yr8yLu?=
 =?us-ascii?q?PO9iMRtJarlMN06OvaiQwo+HR4DsjV1WaRB395hGIGVncF0qF5qEhIix+D3K?=
 =?us-ascii?q?F0juYeFIl7/PJTXwEzc5nGwKpnCN0=3D?=
IronPort-PHdr: =?us-ascii?q?9a23=3AQGVjex3TKd7JZ/GMsmDT+DJfSgsGnvDZIAcR95?=
 =?us-ascii?q?M7irVILfX5rYq3ZR+X7KB3l1aMRoXSsa8a2KLP5qzmQisc8YrS+HtXapFIXg?=
 =?us-ascii?q?8IhYIMkggpEMOJWiiZZLaiJ2RyVIxOAURk5Xy9OA5SAsm4el6B6mbnt2ZLRU?=
 =?us-ascii?q?2vbFcwJunxG4nJl8S6ze3hs52GQgMNvjelZaI3EBLkhgLXqsQQnc5eO748mH?=
 =?us-ascii?q?6r6jMAM6wejStNBHe+2ijx/Nyx+5gxySletugs8cVNSvffcr8jRLNVSRUKYV?=
 =?us-ascii?q?so7s/mvgWRZgDd2nxOfH8Rl0hkChTIvir3WJv8qHnAu/J5yWymOp+TL/h8EX?=
 =?us-ascii?q?zqp+8jYxjulCoBK3sF6mjRkcJ9lud2phmmqx15zNz/Z4eJOfxiO4LxL/gdQ3?=
 =?us-ascii?q?ZMWNoUeyFaCZm9d5cOCOxTB+tDoo/h4ncHsRbsYGvkTKungncAzkX7xqA8z6?=
 =?us-ascii?q?EPCwbDjjYtBN8IrDHvodP5Ob1Aa+2uwa/UiAnEPclbwjr79M3jeUIbrOqBW6?=
 =?us-ascii?q?41VMfK0kAgGkbkoge0qJf5ehKZhIFv+yDTp6IoHaqLinU77iF8piD94sY3ls?=
 =?us-ascii?q?z0gJkIwEvP7yRzzdQRJMakDXVma8WvCppaunO+NpBqB/slWH06nCch1vghpp?=
 =?us-ascii?q?i2ZnouyY87gjfFYPyGbYXbh3CrHK7ZaX8wzDpveOeNhDuA+EWd5bfYeuPr10?=
 =?us-ascii?q?1hhThsz+LjvSxTkCDSttahZsNRpRqGiQjIyC3uv7IMKxU6r5HcBMMA+pQvqp?=
 =?us-ascii?q?4d4QeEAzD7h0P/i4jMEydssqDgo6yvKo3en7aHFJ9+0R/vPoIiq8KWBPwgOS?=
 =?us-ascii?q?EifESk8+Pg8+HC02uma78ViaMpgvPrgLGBD/sa5bW+EVJy0ZwF4lGGBQ+sk4?=
 =?us-ascii?q?4Us2A+L01qeDa66uqhcxmGaLiwRf6Ej1aTwRV129DAOaHTJZb1c3mSiurEZe?=
 =?us-ascii?q?h66nIEkFoQzcBR2cxoMo8MHt3CC3/TtvXmKCEAKQax7+n9Mc1tho4DZT2uDf?=
 =?us-ascii?q?rKeLOXsEWP4PooOfXJfoIOpTLhfvgs/fLghH49yhcNOKiz2p0Pb2qkW/l8OU?=
 =?us-ascii?q?KDNGHtjdEIDXoQs0IyTeCijlqeGSBefXe8TuoP6DA9AYaTXt2ZFKmwnLyM2j?=
 =?us-ascii?q?u6FZRKZ2dAT2qBCmrsa57UCqUJeGSZJctmiDUIUv6sR5JynR2ttQqvy7N9Iu?=
 =?us-ascii?q?Td+ylQ9Yni2958+/DJmFk+9DA8CcOBm3+AVWB6jys7ST4w1aRK4AR9x16P3L?=
 =?us-ascii?q?I+gqlwDt1J6vVAFAAgOtjBzOE=3D?=
IronPort-PHdr: =?us-ascii?q?9a23=3Ag5KLhhfIOpNhvLkfGFpAj1APlGMj4uimEi00z9?=
 =?us-ascii?q?8KlbtKb62//pPkYx2Ft+s41QyBVNDB8PsBkOrf6f2+CiQZtJqHqzceYIAfHx?=
 =?us-ascii?q?RQk8gSlhwtDImfBEnyPPPmPElYVIwKHBcttzm3ZFNUAsv4bhvVuHL08D1BUg?=
 =?us-ascii?q?6qb1IsebylQ9OXj8mz1uep453eeQgbzDroQLU3FhiuqRSUis5EqoxkNqs31l?=
 =?us-ascii?q?71s2NFKYE0jSsgbRrb117Zx+KduaBu6T9RvPRzzcNOXL/3ea81Vu59AS89Om?=
 =?us-ascii?q?84oezH5yLeRwmC7WdOeW5Erh0aLRLC6UPWV4v84BD3sOZwwnugMNXyXPUIXm?=
 =?us-ascii?q?bHje8jAFegwG9PHDk/7GzRlolMlqtduxysvVlSxYXTbICTO6hVeaXBcNUGAE?=
 =?us-ascii?q?ttDO1WUTBMBJ/5Q4YUBPAAJfpZqI+vnVYVoB2iQCWlGO69r10Azje+leVym9?=
 =?us-ascii?q?4sCgzAwEkOBdUL4k7Zt9jzKOIpXOa5wbOa9zjYYvVKnAv6urLFaR0nvbSnVu?=
 =?us-ascii?q?BKfNHcz1VqMg7elVyfpMnEE2Gx1/8R9kmXvY8CHarnwyZv40lVoyOzg+chjp?=
 =?us-ascii?q?GbooMO1hX58z5kyp0+P9yyRRxfYMW4VaBNvTqRLYp8T5EGQnp0/R490aFUnZ?=
 =?us-ascii?q?+gYG0t15Iq3Uz7auebNqGS6RLiSuvCRFUwzDotMPr3z1648R2SycDOX8SJ/w?=
 =?us-ascii?q?xuggAalcLnnWIkiif84ZTZDcd8olmH9Q6jjF30ut8DPm0JwPmTIcsv+IU3uc?=
 =?us-ascii?q?cyiW7cIiv4yAaxkbCbaUMt/c/yjoavKv2u7tfUf7dMsyjlEbQkwdKuDcI0Aw?=
 =?us-ascii?q?YnWnCD8s2Q95Hc90qlZ+lroNtpuaOGt87FNZ4plo/iKTBUkZ0k+UuYDC2A2Z?=
 =?us-ascii?q?Mhl0ENbwhJVgu+jJfGO3XzRZKwRb/3yxzk2D5Qy/L5b5//HrXLKWTxt7TZIL?=
 =?us-ascii?q?cs8RN50FQ0zOwHv8J3CqEPHqzPYnH8ivPpXy8bMSWK5djeEt94+owEYHqfUq?=
 =?us-ascii?q?KEDPzzvgrbrvJqIvOLYpcSoiq4MfU++vry2H8wg1MTdKitjtMHLXGiGfJ+JF?=
 =?us-ascii?q?+FJHf2mNAbRHwLsQw3UPHwhRWOUDIbYXGuF7wx/DA1GcqVA4bFT4SY0+bbjg?=
 =?us-ascii?q?6mAp1bYHxHAVmQEHDuMr+JQOoIdDnCc51kgnoPUrymUYYt0lejuBKpg7ZkL+?=
 =?us-ascii?q?+B+iQCuZzq1dw9p/bSmhc76SFuAoyR0m3FSWZo1n0FXT44zehMr017w1O2kO?=
 =?us-ascii?q?B4jvVUGMYV5qZhSQYgOJjVietgBJbvWQ8=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0GLAACsG55dbemAioBlGQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBEQEBAQEBAQEBAQEBTYEughsFgUIdEiqNJYVbTgEBAQEBBlN?=
 =?us-ascii?q?jgSKIVpEwBwEBAQEBAQEBAQMFLQIBAQGHESM4EwIBAQEJAQEBAwEBAQIBBQI?=
 =?us-ascii?q?BAQICEA0LCQYrhTQMhDAsDVRkAQUBAj0BATcBBQkBAQoYCRMSAwwFGDEYgx6?=
 =?us-ascii?q?CUiUEshOCfgGHMgcJgTSBU4o7GHiBB4QjPoQkAQEChggEjzSeD4Isgi+FSo0?=
 =?us-ascii?q?UDBuCKhCHTo84qAuBaYF7MxoIKAiDJ1AQFFV6i22CWnOBCI1OgkUBAQ?=
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0GBAADqEJ5dh0tDioBlGQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBEQEBAQEBAQEBAQEBTYEughuBRh0SKo0lhVlTBlNjgSKIVpE?=
 =?us-ascii?q?wBwEBAQEBAQEBAQMFLQIBAQGHESM4EwIBAQEJAQEBAwEBAQIBBQIBAQICEAE?=
 =?us-ascii?q?BAQoLCQgphTQMhDAsDVRkAQIDAQI9AQE3AQUJAQEKGAkTEgMMBRgxGIMdAYF?=
 =?us-ascii?q?2FASyD4J+AYcyBwmBNIFTijsYeIEHhCM+hCQBAQKGAgSPNJ4PgiyCL4VKjRQ?=
 =?us-ascii?q?MG4IqEIdOjzioC4FpgXszGggoCIMnUBAUVXqLbYJac4EIkRiCRQEB?=
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0E8AgBKBp5dfU1DioBlhFyBYxKNT4c?=
 =?us-ascii?q?GggWaDQEBAQEBAQEBAQMFLQIBAQGHNDgTAwIJAQEBAwECAgEFAgEBAgIQAQE?=
 =?us-ascii?q?LFAiFaYQwLGFkAQUBAj0BATcBBQkBAQoYCRMSAwwFGDEYgx6CCgSyBoJ+AYc?=
 =?us-ascii?q?0BwkgjTqBf4QjPoQkAQEChgKPOJ4PgiyCL4VKjRQMG4I6h06POKgLgWmBezM?=
 =?us-ascii?q?aCCgIg3cQFFWPQUKBOZEYgkUBAQ?=
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FHAABKBp5dh0O0hNFlGQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBEQEBAQEBAQEBAQEBTYEughuBRDEqjSWFWlMGU2MUgQ6IVpE?=
 =?us-ascii?q?wBwEBAQEBAQEBAQMFLAECAQEBhxEjOBMCAQEBCQEBAQMBAQECAQUCAQECAhA?=
 =?us-ascii?q?BAQEKCwkIKYU0DIQwLA1UZAECAwECPQEBNwEFCQEBChgJExIDDAUYMRiDHQG?=
 =?us-ascii?q?BdhQEsgaCfgGHNAcJgTSBU4o7GHiBB4QjPoQkAQEChgIEjzSeD4Isgi+FSo0?=
 =?us-ascii?q?UDBuCKhCHTo84qAuBaYF7MxoIKAiDJ1AQFFV6i22CWkEygQYBAZEYgkUBAQ?=
X-IPAS-Result: =?us-ascii?q?A0GLAACsG55dbemAioBlGQEBAQEBAQEBAQEBAQEBAQEBE?=
 =?us-ascii?q?QEBAQEBAQEBAQEBTYEughsFgUIdEiqNJYVbTgEBAQEBBlNjgSKIVpEwBwEBA?=
 =?us-ascii?q?QEBAQEBAQMFLQIBAQGHESM4EwIBAQEJAQEBAwEBAQIBBQIBAQICEA0LCQYrh?=
 =?us-ascii?q?TQMhDAsDVRkAQUBAj0BATcBBQkBAQoYCRMSAwwFGDEYgx6CUiUEshOCfgGHM?=
 =?us-ascii?q?gcJgTSBU4o7GHiBB4QjPoQkAQEChggEjzSeD4Isgi+FSo0UDBuCKhCHTo84q?=
 =?us-ascii?q?AuBaYF7MxoIKAiDJ1AQFFV6i22CWnOBCI1OgkUBAQ?=
X-IPAS-Result: =?us-ascii?q?A0GBAADqEJ5dh0tDioBlGQEBAQEBAQEBAQEBAQEBAQEBE?=
 =?us-ascii?q?QEBAQEBAQEBAQEBTYEughuBRh0SKo0lhVlTBlNjgSKIVpEwBwEBAQEBAQEBA?=
 =?us-ascii?q?QMFLQIBAQGHESM4EwIBAQEJAQEBAwEBAQIBBQIBAQICEAEBAQoLCQgphTQMh?=
 =?us-ascii?q?DAsDVRkAQIDAQI9AQE3AQUJAQEKGAkTEgMMBRgxGIMdAYF2FASyD4J+AYcyB?=
 =?us-ascii?q?wmBNIFTijsYeIEHhCM+hCQBAQKGAgSPNJ4PgiyCL4VKjRQMG4IqEIdOjzioC?=
 =?us-ascii?q?4FpgXszGggoCIMnUBAUVXqLbYJac4EIkRiCRQEB?=
X-IPAS-Result: =?us-ascii?q?A0E8AgBKBp5dfU1DioBlhFyBYxKNT4cGggWaDQEBAQEBA?=
 =?us-ascii?q?QEBAQMFLQIBAQGHNDgTAwIJAQEBAwECAgEFAgEBAgIQAQELFAiFaYQwLGFkA?=
 =?us-ascii?q?QUBAj0BATcBBQkBAQoYCRMSAwwFGDEYgx6CCgSyBoJ+AYc0BwkgjTqBf4QjP?=
 =?us-ascii?q?oQkAQEChgKPOJ4PgiyCL4VKjRQMG4I6h06POKgLgWmBezMaCCgIg3cQFFWPQ?=
 =?us-ascii?q?UKBOZEYgkUBAQ?=
X-IPAS-Result: =?us-ascii?q?A0FHAABKBp5dh0O0hNFlGQEBAQEBAQEBAQEBAQEBAQEBE?=
 =?us-ascii?q?QEBAQEBAQEBAQEBTYEughuBRDEqjSWFWlMGU2MUgQ6IVpEwBwEBAQEBAQEBA?=
 =?us-ascii?q?QMFLAECAQEBhxEjOBMCAQEBCQEBAQMBAQECAQUCAQECAhABAQEKCwkIKYU0D?=
 =?us-ascii?q?IQwLA1UZAECAwECPQEBNwEFCQEBChgJExIDDAUYMRiDHQGBdhQEsgaCfgGHN?=
 =?us-ascii?q?AcJgTSBU4o7GHiBB4QjPoQkAQEChgIEjzSeD4Isgi+FSo0UDBuCKhCHTo84q?=
 =?us-ascii?q?AuBaYF7MxoIKAiDJ1AQFFV6i22CWkEygQYBAZEYgkUBAQ?=
X-IronPort-AV: E=Sophos; i="5.67,277,1566885600"; d="asc'?scan'208";
 a="369288500"
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="asc'?scan'208";
 a="287074225"
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="asc'?scan'208";
 a="369137896"
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="asc'?scan'208";
 a="369083906"
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: migi9492@g.colorado.edu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; 
 s=20170815-heliosphere; h=In-Reply-To:Content-Type:       
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To: 
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date: 
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:    
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZkEZaeUG2LDB7osCCzA5SGc46/Ti4vNDPD35O8V/wEU=;
 b=fRSoG5IPBwTlf8+/uwewnaoO2       
 PPQAsKxb3vydNdYfAmppcADKDWbo4O4IFN7Cb7o6wx2ZXI3BWi+soz5OkrNa/QbPb+2dFqQkwGhLU 
 aSdjW9JvtHnotZOkP5i9r5Mp6oiT008KhxfV6TPVeVGY9XJjAVNVQrbmDgrQpx8euT7Ig=;
Date: Wed, 9 Oct 2019 17:00:21 +0100
From: "Mark Brown" <broonie@kernel.org>
To: "Oleksandr Suvorov" <oleksandr.suvorov@toradex.com>
Message-ID: <20191009160021.GI2036@sirena.org.uk>
References: <20191009142822.14808-1-oleksandr.suvorov@toradex.com>
MIME-Version: 1.0
In-Reply-To: <20191009142822.14808-1-oleksandr.suvorov@toradex.com>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
X-MS-Exchange-Organization-ExpirationStartTime: 09 Oct 2019 17:51:04.3084 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 9ca765df-a0ba-4993-4429-08d74ce1414c
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-Forefront-Antispam-Report: CIP:128.138.67.75; IPV:CAL; CTRY:US; EFV:NLI;
 SFV:SKN; SFS:; DIR:INB; SFP:; SCL:-1; SRVR:DM5PR03MB2668; H:ipmx4.colorado.edu;
 FPR:; SPF:None; LANG:en; ; SKIP:1; 
X-MS-Exchange-Organization-AuthSource: SN1NAM01FT048.eop-nam01.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: colorado.edu
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ca765df-a0ba-4993-4429-08d74ce1414c
X-MS-TrafficTypeDiagnostic: DM5PR03MB2668:|DM5PR03MB2668:
X-MS-Exchange-Organization-SCL: -1
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 17:51:04.1092 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca765df-a0ba-4993-4429-08d74ce1414c
X-MS-Exchange-CrossTenant-Id: 3ded8b1b-070d-4629-82e4-c0b019f46057
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3ded8b1b-070d-4629-82e4-c0b019f46057; Ip=[128.138.67.75];
 Helo=[ipmx4.colorado.edu]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2668
X-MS-Exchange-Transport-EndToEndLatency: 00:45:33.0362007
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2347.014
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; ex:0; auth:0; dest:I;
 ENG:(750127)(520002050)(944506383)(944626516); 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZiEpCuLZ7OFOPCLQku7UJvUG4Lv/z2lh7xBMtpN/1YYFWrKLP+/Cproa1TpA?=
 =?us-ascii?Q?25EQOaZT/T1hA+8Kr9j4Vw/ixB+KANmIj/+G1es3obxbJuG1u8BlFTOc1p3I?=
 =?us-ascii?Q?QRx1J29R3Tu6hd9w3UWwbrOeWWcSEgKX3/UMSuAj4Vg4w/SXWkrKvoD5QMhn?=
 =?us-ascii?Q?aZ+fect8ukRnC58KTVoMwWtz3cF95QK36STYuIbPrcTUvXoCcXVBomhLYVM3?=
 =?us-ascii?Q?kc8V/SyK+QOZJSdolfA0sGh9ian3UfwbDUtoXoSMZt7kZfsVkS4n70uBfHT9?=
 =?us-ascii?Q?V+F5sl4i6/s9P2fehyCMV1WWHiann35I20hvtWGvNSRQZcppPCUPVR2DyXsw?=
 =?us-ascii?Q?wFy/w9Km98/LJGHp+J8QKmDbeKNyQnEw3qm60Toa9rMSyK6PFk617UPA2HW8?=
 =?us-ascii?Q?upFFIMNbAUBSJCeD53c1tpyZmGAOgINu+qvHbbkFDuMwAoWVeodGq818e46z?=
 =?us-ascii?Q?sL1YIIx0sPeebJTimwdfGWuJjljE4v6qSVboaKuYNrHltIlRKw9DPEsB8Lc7?=
 =?us-ascii?Q?MAHnfCX/2vGmfsS4atSpv9lth0/3sE26OXQuCpb2p2qSKiQ/d82eDsykuzap?=
 =?us-ascii?Q?TykmyglQP2AuN5bAzHXE+tLF05/SP0gsFXXhZ8O5gf9guahlzwGozr+S39w+?=
 =?us-ascii?Q?AqS17n8qIHBvSwB4Lpdeolcaq846jGg4EPzls5Lu2wfcu+lCjHQKqX1b1fZv?=
 =?us-ascii?Q?vVwbCmVRnrYawl3089olhTQr3t40ij6187Lb0gwT09JkW4sa3Yk3XyNtF8tt?=
 =?us-ascii?Q?FtrzDDzMZH/kYAlAG/6W60PPfuaiLz3byF0GDGUBv9XlJ1WQrH3rLC9KSPtu?=
 =?us-ascii?Q?6CSW2mWNDbjNwmPcX1RIcTVoFPuCwLUm9N8/Kj7aTR5F2hR2tAF1S9PVdKsp?=
 =?us-ascii?Q?INP7Dp4tDFfNhtcdIgWFQMIWDAeZ4cbapY8B/VaF+T9wMjEztPniQXCnKzvL?=
 =?us-ascii?Q?o99MtEG6V10q3BMt1m6bmSJx2z9lD6gkASI0oKaymTGFmWgrtm2MLxjGOJU0?=
 =?us-ascii?Q?D2qtJae7z2J/f9ZsS0HGgKuDuNvi+R9bkr5q7sZqn/AXecNuA7sYSb1pKE+1?=
 =?us-ascii?Q?L6L6PYZTEnB9aw7ZwNBYQIvOmnJq4CzktyV6Gdv3hWUo1hpOp1E=3D?=
Content-Disposition: inline
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Sasha Levin <sashal@kernel.org>, Igor
 Opaniuk <igor.opaniuk@toradex.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH 0/1] [for 4.4/4.9] VAG power control
	improvement for sgtl5000 codec
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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

On Wed, Oct 09, 2019 at 02:28:36PM +0000, Oleksandr Suvorov wrote:
> 
> This is a backport to stable kernel versions 4.4 and 4.9.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that 
any important information is recorded in the changelog rather than being
lost. 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
