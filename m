Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF43D540A
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Oct 2019 05:44:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF0711671;
	Sun, 13 Oct 2019 05:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF0711671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570938292;
	bh=Zxn/1t0zlsFzNVCNroShZLyS5KUg5+6qL4w3en4K4WA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qfJh0F7s8rG1L39hd/TqDCNMvDZi/AC76+pStySVv1j2WxjFdfNRBgN+hwpTBcKOB
	 dvqX4ka+kN9t/zWlpLBhXPvi/oiXA1CVBbGXMW689fFT/7RpfuXdGPCNu7Ljy3wPxK
	 6DEI1CMqSr/mle7CtoLci7gm8NGo/bkeW5kU83Qg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 250E7F8036C;
	Sun, 13 Oct 2019 05:43:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4587FF8036C; Sun, 13 Oct 2019 05:43:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from listssympa-test.colorado.edu (listssympa-test.colorado.edu
 [128.138.129.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25835F80212
 for <alsa-devel@alsa-project.org>; Sun, 13 Oct 2019 05:42:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25835F80212
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=sirena.org.uk header.i=@sirena.org.uk header.b="Av22dA3b"
Received: from listssympa-test.colorado.edu (localhost [127.0.0.1])
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/sympa) with ESMTPS id
 x9D3gpvP003627
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 12 Oct 2019 21:42:51 -0600
Received: (from root@localhost)
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/submit) id
 x9D3goxO003584; Sat, 12 Oct 2019 21:42:50 -0600
Received: from MN2PR03MB4717.namprd03.prod.outlook.com (2603:10b6:a03:f4::43)
 by BYAPR03MB4376.namprd03.prod.outlook.com with HTTPS via
 BYAPR11CA0102.NAMPRD11.PROD.OUTLOOK.COM; Wed, 9 Oct 2019 19:27:50 +0000
Received: from CY1PR03CA0017.namprd03.prod.outlook.com (2603:10b6:600::27) by
 MN2PR03MB4717.namprd03.prod.outlook.com (2603:10b6:208:100::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Wed, 9 Oct
 2019 18:11:58 +0000
Received: from BY2NAM01FT008.eop-nam01.prod.protection.outlook.com
 (2a01:111:f400:7e42::209) by CY1PR03CA0017.outlook.office365.com
 (2603:10b6:600::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Wed, 9 Oct 2019 18:11:58 +0000
Received: from ipmx2.colorado.edu (128.138.128.232) by
 BY2NAM01FT008.mail.protection.outlook.com (10.152.69.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2347.16 via Frontend Transport; Wed, 9 Oct 2019 18:11:57 +0000
Received: from ipmx4.colorado.edu ([128.138.67.75])  by mx.colorado.edu with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 11:19:03 -0600
Received: from vger.kernel.org ([209.132.180.67]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 10:48:07 -0600
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand id
 S1731478AbfJIQsF (ORCPT <rfc822; michael.gilroy@colorado.edu>);
 Wed, 9 Oct 2019 12:48:05 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:43354 "EHLO 
 heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by
 vger.kernel.org with ESMTP id S1730490AbfJIQsF (ORCPT       
 <rfc822; linux-kernel@vger.kernel.org>); Wed, 9 Oct 2019 12:48:05 -0400
Received: from 188.31.199.195.threembb.co.uk ([188.31.199.195]
 helo=fitzroy.sirena.org.uk)        by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)        (Exim 4.92)       
 (envelope-from <broonie@sirena.org.uk>)        id 1iIF84-0005G5-IY; Wed, 09
 Oct 2019 16:48:01 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000) id A3798D03ED3; 
 Wed,  9 Oct 2019 17:47:36 +0100 (BST)
Authentication-Results: spf=none (sender IP is 128.138.128.232)
 smtp.mailfrom=vger.kernel.org; 
 o365.colorado.edu; dkim=fail (signature did not verify)
 header.d=sirena.org.uk;o365.colorado.edu; dmarc=fail action=none
 header.from=kernel.org;
Received-SPF: None (protection.outlook.com: vger.kernel.org does not designate
 permitted sender hosts)
Authentication-Results-Original: mx.colorado.edu;
 dkim=hardfail (signature did not verify
 [final]) header.i=@sirena.org.uk
IronPort-SDR: YtQuImWslxQkxXgL4f1X37AAYGa4waMj15vjLZy+Ulml7Wo1bOUVY9ZX4Az1JVHnl0JXHJIos/
 5oI/5zjUbhG/t/d6nNzKNW3ruCAlVSK5Q=
IronPort-SDR: jJWRZBFTy0a37iMxGHxDzPpUIEN8roNX12C1DGl2w9PgzO3dIXzcfWwXSElMgZ7QTihWPDTkrH
 QaKSTl+iju703Gb7FfepGYgHG50A+mxfo=
IronPort-PHdr: =?us-ascii?q?9a23=3Apr3cxBM5m8G/RomXko8l6mtUO3oLmJTReyML45?=
 =?us-ascii?q?46gq5PdaL8rs6wIhmGtr1k2UXSVMDA6/se1rSF+7m1VWobpoqRrCNKe8lWWh?=
 =?us-ascii?q?sMmcga2BYtBMeVBEGoSZyiJ2RyVIwKHFMw5HChPE5cXsHkaBvPoS769mtIQk?=
 =?us-ascii?q?ygbVose6H1F4rTiN+v1+2o9s6bY1Bpgn+HbKt2PVCKqlf6sc8KjI1+b5og0h?=
 =?us-ascii?q?abxxkAM6wejSsgbXeyuju52Mqq559k9XZqtvws7cNGWqjhLYE1VqdRAzljEk?=
 =?us-ascii?q?xn39DhtxTIUVmk7SkgVTc4iB1NUSTM8ByoZZr3vibg5NBwwC2LePHxH9VWEX?=
 =?us-ascii?q?zqp+8jAFfDjyEbOjgltV3Ng8prgq9B5T+nrBtzwojbMqqSMuZzeL+YXP9Ibm?=
 =?us-ascii?q?1HQstXS2ltD5i3dYoXE+sGO7RiopLwoUdLgRKiCFvJZqungncAzje+56Ah3u?=
 =?us-ascii?q?I9VC/c2wlyJd8VvXLI6e74MqsfS7KPwbLFyymGU/QE4zrm5Y7UNzsq88uBRr?=
 =?us-ascii?q?92bY/0xFI0HgzIy3S8+6jkJC/Q9+hf1grTp6IoHarnw0omsB00gjWr3pUIi5?=
 =?us-ascii?q?LVw78T0U3O7i5jwYw4d/m5U1I+WsOuC5BKtiuXZa93Wd9ne2ZzpHQey6Ya/L?=
 =?us-ascii?q?mkeiUQmrAm3AKaQuaMc4mW70GGNq7ZaX8wzDotMLi/0gaz8Xbjyvffa9OE6l?=
 =?us-ascii?q?9nqSNjr4XHpFQW6xj2wNKFUsJP4UqT3Cei7i3/t7kRcgg+wIPFccQt6+U6y7?=
 =?us-ascii?q?wNrE/5RQ/EsUanob21UURBmKDgo6yvKv2updi6HtNqoR+9C54DnMGxIs4REQ?=
 =?us-ascii?q?okADbA8NygyLLT8m3Zb7JLid1utrv1vovYDJw3pbKnIxVfjtgzt0mZCzXhk+?=
 =?us-ascii?q?gemV4tPVkcfUq40IyMWRmGaLiwRb/3gX2VnxIxy+HrH4bHGdLMc0HfyZKmTZ?=
 =?us-ascii?q?FXqHFB6FUiyMJuv41xNe8EY9X1cQj7uNbbJzBnahCW4trOLNVF8ZIHdCXMXb?=
 =?us-ascii?q?KoZfCaoRqJ/OUpO+6WeMoPtS3gL+Rw5/f0gXEwmFtONbns3IEQbmi/BOgjLl?=
 =?us-ascii?q?+DZmC5mdYOF24WoxAzBODrhBWEViIbeXuoXqwtrgI1CYSvCbKQHNr/qaGd3C?=
 =?us-ascii?q?q9Apxdb3xHDVbJK3rzaoGYQKddOieCZMRmljseXLSmDYItyELmuAz7zu9nJ/?=
 =?us-ascii?q?DY9CQZsdqjz9l64eTPiAs/vTB1A4yb1H3FUWxun20ZDww43aZ2pXk8gleO2K?=
 =?us-ascii?q?R1mbpZQPRI5ulEVA58MoTTifF5Bg=3D=3D?=
IronPort-PHdr: =?us-ascii?q?9a23=3Ab1/XcRM/13YiSvulrscl6mtUO3oLmJTReyML45?=
 =?us-ascii?q?46gq5PdaL8rs6wIhmGtr1k2UXSVMDA6/se1rSF+7m1VWobpoqRrCNKe8lWWh?=
 =?us-ascii?q?sMmcga2BYtBMeVBEGoSZyiJ2RyVIwKHFMw5HChPE5cXsHkaBvPoS769mtIQk?=
 =?us-ascii?q?ygbVose6H1F4rTiN+v1+2o9s6bY1Bpgn+HbKt2PVCKqlf6sc8KjI1+b5og0h?=
 =?us-ascii?q?abxxkAM6wejSsgbXeyuju52Mqq559k9XZqtvws7cNGWqjhLYE1VqdRAzljEk?=
 =?us-ascii?q?xn39DhtxTIUVmk7SkgVTc4iB1NUSTM8ByoZZr3vibg5NBwwC2LePHxH9VWEX?=
 =?us-ascii?q?zqp+8jAFfDjyEbOjgltV3Ng8prgq9B5T+nrBtzwojbMqqSMuZzeL+YXP9Ibm?=
 =?us-ascii?q?1HQstXS2ltD5i3dYoXE+sGO7RiopLwoUdLgRKiCFvJZqungncAzje+56Ah3u?=
 =?us-ascii?q?I9VC/c2wlyJd8VvXLI6e74MqsfS7KPwbLFyymGU/QE4zrm5Y7UNzsq88uBRr?=
 =?us-ascii?q?92bY/0xFI0HgzIy3S8+6jkJC/Q9+hf1grTp6IoHarnw0omsB00gjWr3pUIi5?=
 =?us-ascii?q?LVw78T0U3O7i5jwYw4d/m5U1I+WsOuC5BKtiuXZa93Wd9ne2ZzpHQey6Ya/L?=
 =?us-ascii?q?mkeiUQmrAm3AKaQuaMc4mW70GGNq7ZaX8wzDotMLi/0gaz8Xbjyvffa9OE6l?=
 =?us-ascii?q?9nqSNjr4XHpFQW6xj2wNKFUsJP4UqT3Cei7i3/t7kRcgg+wIPFccQt6+U6y7?=
 =?us-ascii?q?wNrE/5RQ/EsUanob21UURBmKDgo6yvKv2updi6HtNqoR+9C54DnMGxIs4REQ?=
 =?us-ascii?q?okADbA8NygyLLT8m3Zb7JLid1utrv1vovYDJw3pbKnIxVfjtgzt0mZCzXhk+?=
 =?us-ascii?q?gemV4tPVkcfUq40IyMWRmGaLiwRb/3gX2VnxIxy+HrH4bHGdLMc0HfyZKmTZ?=
 =?us-ascii?q?FXqHFB6FUiyMJuv41xNe8EY9X1cQj7uNbbJzBnahCW4trOLNVF8ZIHdCXMXb?=
 =?us-ascii?q?KoZfCaoRqJ/OUpO+6WeMoPtS3gL+Rw5/f0gXEwmFtONbns3IEQbmi/BOgjLl?=
 =?us-ascii?q?+DZmC5mdYOF24WoxAzBODrhBWEViIbeXuoXqwtrgI1CYSvCbKQHNr/qaGd3C?=
 =?us-ascii?q?q9Apxdb3xHDVbJK3rzaoGYQKddOieCZMRmljseXLSmDYItyELmuAz7zu9nJ/?=
 =?us-ascii?q?DY9CQZsdqjz9l64eTPiAs/vTB1A4yb1H3FUWxun20ZDww43aZ2pXk8gleO2K?=
 =?us-ascii?q?R1mbpZQPRI5ulEVA58MoTTifF5Bg=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FMAADGIZ5dbUtDioBlGQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBEQEBAQEBAQEBAQEBTYEughsFgXEqjSWFW04BAQEBAQZTY4E?=
 =?us-ascii?q?iiFaRJQMIBwEBAQEBAQEBAQMFGBUCAQEBhxEjOBMCAQEBCQEBAQMBAQECAQU?=
 =?us-ascii?q?CAQECAhANCwkGK4U0DIQwLA1UYwEBAQEDAQI9AQE3AQUJAQEKFQMJExIDDAU?=
 =?us-ascii?q?YMRMFgx6CUiUEsAaCJ4J+AYcyBwmBNIFTijsYeIEHhCM+ijAErUOCLIIvkl4?=
 =?us-ascii?q?MG4IqlxaoC4FpgXszGggoCIMnUBAUgU+LbYJaQjGBCI0/AiQBAoIrAQE?=
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FUAACKFJ5dh0O0hNFlGQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBEQEBAQEBAQEBAQEBTYEughuBRTEqjSWFWlEBAQZTYxSBDoh?=
 =?us-ascii?q?WkSUDCAcBAQEBAQEBAQEDBRgUAQIBAQGHESM4EwIBAQEJAQEBAwEBAQIBBQI?=
 =?us-ascii?q?BAQICEAEBAQoLCQgphTQMhDAsDVRjAQEBAQMBAj0BATcBBQkBAQoVAwkTEgM?=
 =?us-ascii?q?MBRgxEwWDHQGCUiUEr2WCJ4J+AYc1BwmBNIFTijsYeIEHhCM+ijAErUOCLII?=
 =?us-ascii?q?vkl4MG4IqlxaoC4FpgXszGggoCIMnUBAUgU+LbYJaQTKBBgEBjT8CJAECgis?=
 =?us-ascii?q?BAQ?=
X-IPAS-Result: =?us-ascii?q?A0FMAADGIZ5dbUtDioBlGQEBAQEBAQEBAQEBAQEBAQEBE?=
 =?us-ascii?q?QEBAQEBAQEBAQEBTYEughsFgXEqjSWFW04BAQEBAQZTY4EiiFaRJQMIBwEBA?=
 =?us-ascii?q?QEBAQEBAQMFGBUCAQEBhxEjOBMCAQEBCQEBAQMBAQECAQUCAQECAhANCwkGK?=
 =?us-ascii?q?4U0DIQwLA1UYwEBAQEDAQI9AQE3AQUJAQEKFQMJExIDDAUYMRMFgx6CUiUEs?=
 =?us-ascii?q?AaCJ4J+AYcyBwmBNIFTijsYeIEHhCM+ijAErUOCLIIvkl4MG4IqlxaoC4Fpg?=
 =?us-ascii?q?XszGggoCIMnUBAUgU+LbYJaQjGBCI0/AiQBAoIrAQE?=
X-IPAS-Result: =?us-ascii?q?A0FUAACKFJ5dh0O0hNFlGQEBAQEBAQEBAQEBAQEBAQEBE?=
 =?us-ascii?q?QEBAQEBAQEBAQEBTYEughuBRTEqjSWFWlEBAQZTYxSBDohWkSUDCAcBAQEBA?=
 =?us-ascii?q?QEBAQEDBRgUAQIBAQGHESM4EwIBAQEJAQEBAwEBAQIBBQIBAQICEAEBAQoLC?=
 =?us-ascii?q?QgphTQMhDAsDVRjAQEBAQMBAj0BATcBBQkBAQoVAwkTEgMMBRgxEwWDHQGCU?=
 =?us-ascii?q?iUEr2WCJ4J+AYc1BwmBNIFTijsYeIEHhCM+ijAErUOCLIIvkl4MG4IqlxaoC?=
 =?us-ascii?q?4FpgXszGggoCIMnUBAUgU+LbYJaQTKBBgEBjT8CJAECgisBAQ?=
X-IronPort-AV: E=Sophos; i="5.67,277,1566885600"; d="asc'?scan'208";
 a="414288113"
X-IronPort-AV: E=Sophos; i="5.67,277,1566885600"; d="asc'?scan'208";
 a="369236112"
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-Original-Recipients: migi9492@g.colorado.edu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; 
 s=20170815-heliosphere; h=In-Reply-To:Content-Type:       
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To: 
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date: 
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:    
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xihV+hrKUrXRaEoaNU4czLsTlMBrjpQZweZmyEQED50=;
 b=Av22dA3b5NvucR3HZAk9EzKOi       
 k/NA4vCv+QREnefKBAKjB763aPttgXgHHGoioH0LzDfsjA0DktvHrb46x47Nlj/+TnlOByc1m0W7l 
 jAQgM2dyEISNs/i5Qt1M/XOB+WuH7ymzY0wMW6m+OnC/bdbkAG61tJITALhPOyqE/+7uY=;
Date: Wed, 9 Oct 2019 17:47:36 +0100
From: "Mark Brown" <broonie@kernel.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@linaro.org>
Message-ID: <20191009164736.GL2036@sirena.org.uk>
References: <20191009104603.15412-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20191009104603.15412-1-srinivas.kandagatla@linaro.org>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
X-MS-Exchange-Organization-ExpirationStartTime: 09 Oct 2019 18:11:57.8874 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 32de43c7-fc34-40b7-3df7-08d74ce42c7d
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-Forefront-Antispam-Report: CIP:128.138.128.232; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:SKN; SFS:; DIR:INB; SFP:; SCL:-1; SRVR:MN2PR03MB4717; H:ipmx2.colorado.edu;
 FPR:; SPF:None; LANG:en; ; SKIP:1; 
X-MS-Exchange-Organization-AuthSource: BY2NAM01FT008.eop-nam01.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: colorado.edu
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32de43c7-fc34-40b7-3df7-08d74ce42c7d
X-MS-TrafficTypeDiagnostic: MN2PR03MB4717:|MN2PR03MB4717:
X-MS-Exchange-Organization-SCL: -1
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 18:11:57.6002 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32de43c7-fc34-40b7-3df7-08d74ce42c7d
X-MS-Exchange-CrossTenant-Id: 3ded8b1b-070d-4629-82e4-c0b019f46057
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3ded8b1b-070d-4629-82e4-c0b019f46057; Ip=[128.138.128.232];
 Helo=[ipmx2.colorado.edu]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4717
X-MS-Exchange-Transport-EndToEndLatency: 01:15:56.0796371
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2347.014
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; ex:0; auth:0; dest:I;
 ENG:(750127)(520002050)(944506383)(944626516); 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B4HpossYxyBqpjPch3uUKwETkqYJHpZ0oVR677eBerFzJ+aK9HKcUYF1PM4a?=
 =?us-ascii?Q?fMeuC8IZKdvZPKKrzDotxGvK63P4b6ZsQIL+0gMmduhuRxhcP6I6NEmcaG8X?=
 =?us-ascii?Q?HYvzkRlKBYJR2yk+4kdtMj6KKaa0KywdjMMEM90FNpgzlxv1r4GUehsrOyZk?=
 =?us-ascii?Q?DCOTP6T3joOM/dBWgE4+x5GN6cL4iqaUaUvPOsI+vktCO0DKOb4j2usur0j/?=
 =?us-ascii?Q?sy72X0Uf1CHwIaT1GnlMV9xzd0fZf6BUDmGJ4mzGAUXxGKABUGFuXriRzMrm?=
 =?us-ascii?Q?18AoA4lCiqqVZm0S7A2gWyJk1PGXh8i9DiiJZXDgJADkE3m4b77BBwH/ysZN?=
 =?us-ascii?Q?sRt7qJ5ssAgzlrSQceadNXVaHIIWzys1A2tRWacOrj11wVv2LuoP6G/4e+t+?=
 =?us-ascii?Q?6ZFyqN07hOqgJlqlv/VPUQeyZLG3ktwXZTpwc+PfR5uzIwRPlFtWYzv6HehD?=
 =?us-ascii?Q?+lP1+3eecU84QMpm4X2BhOKbvh/SQpvnMpYPPU8ivvUgFuBwakHV5GOgL/Hx?=
 =?us-ascii?Q?kPmOrarXNhAQt0v1ITw2oxu3fyr/bu303GFZaHzwnuYXzQuMSJx0DvoRtSfU?=
 =?us-ascii?Q?yFqYw+NhwRP5Sp5pugQQy4lUZj2GFuQc4qxNG/eh/MzvxUJNr5RLKoHqizFe?=
 =?us-ascii?Q?8Sh7W6Md355Av73BTzLD7vnx6a110Xz78ukhCu0Pk1B3OklXkRQ4hyRFzN5n?=
 =?us-ascii?Q?rd7eOiT9MTI2UbURX9BMmDZ+BMVn5l8ZYmPEnmR93H+lGp1Nuxn12oIBEWjR?=
 =?us-ascii?Q?qjszYTVCAgks2iPry36PYmKyPuuj4wa8Fq4sfaQxPmCjSb5sv/l1Q9XtuOF8?=
 =?us-ascii?Q?x5Oqhmq5X4iS2VGj/b6hnGMCpcKjqHmq6uXuw9pLGhSv9jxpC/sf6VsVKAtc?=
 =?us-ascii?Q?bNRG1+kWLzzQ1x7hB247+xYGN+MU4dhF9OnSDbajWbZcj8XydNrOUhHYO2vN?=
 =?us-ascii?Q?5ygytjFhztH00XkDMUcYO6NMVAMgDVjvOQiCDlvte1mAqWrD/w5Cdlh+eWz5?=
 =?us-ascii?Q?dzSfSMTm3NYs5gyg1WANZiVfXxlHu2sC4191se0+MsdzXnzNY9ZPwXDYEG/4?=
 =?us-ascii?Q?+df01UU6DdpZQZc9lczSjz+XQ8qcAPieSAmuRrLLRSP9JaMVr/I=3D?=
Content-Disposition: inline
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "bgoswami@codeaurora.org" <bgoswami@codeaurora.org>,
 "spapothi@codeaurora.org" <spapothi@codeaurora.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 Gopikrishnaiah Anandan <agopik@codeaurora.org>
Subject: Re: [alsa-devel] [RFC PATCH] ASoC: soc-dapm: Skip suspending
	widgets with ignore flag
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

On Wed, Oct 09, 2019 at 11:46:03AM +0100, Srinivas Kandagatla wrote:
> From: Sudheer Papothi <spapothi@codeaurora.org>
> 
> For wigdets which have set the suspend ignore flag asoc framework
> shouldn't mark them as dirty when ASoC suspend function is called.
> This change adds check to skip suspending the widgets with the flag set.

Why?  The goal here is to ensure we revalidate everything on
resume, and flow any changes out.  It doesn't actually result in
changes in state on these widgets if they're still powered on.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
