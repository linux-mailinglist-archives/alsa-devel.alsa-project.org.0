Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD90D536D
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Oct 2019 02:27:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30F091670;
	Sun, 13 Oct 2019 02:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30F091670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570926455;
	bh=kVaSiHLaInSmfGurC64UxXB2wKevtD4MapCEDlqGJwQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tS4kDDl0IMSjpA4ykonv9viiozdrcmwSXRmAQedLIIG6YWsUvaYmrTwpJo61m8a4M
	 hvchX2qZahMofRtvN90jtJgNM4UpwP3vnILUBqum0BkjZsbiZFlfydb0rtLHngVEIj
	 GvnieFK4lxCWwXJbDRnfUuldLXdK2hqjT4ZIMjOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BA37F8036D;
	Sun, 13 Oct 2019 02:25:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 943D5F8038F; Sun, 13 Oct 2019 02:25:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from listssympa-test.colorado.edu (listssympa-test.colorado.edu
 [128.138.129.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34F1BF800DA
 for <alsa-devel@alsa-project.org>; Sun, 13 Oct 2019 02:25:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34F1BF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=sirena.org.uk header.i=@sirena.org.uk header.b="xxg1yPso"
Received: from listssympa-test.colorado.edu (localhost [127.0.0.1])
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/sympa) with ESMTPS id
 x9D0Pf4q014700
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 12 Oct 2019 18:25:41 -0600
Received: (from root@localhost)
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/submit) id
 x9D0PeIT014694; Sat, 12 Oct 2019 18:25:40 -0600
Received: from CO2PR03MB2184.namprd03.prod.outlook.com (2603:10b6:a03:14b::33)
 by BYAPR03MB4376.namprd03.prod.outlook.com with HTTPS via
 BYAPR06CA0056.NAMPRD06.PROD.OUTLOOK.COM; Wed, 9 Oct 2019 18:49:03 +0000
Received: from BN3PR03CA0077.namprd03.prod.outlook.com
 (2a01:111:e400:7a4d::37) by
 CO2PR03MB2184.namprd03.prod.outlook.com (2603:10b6:102:f::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
 id 15.20.2347.16; Wed, 9 Oct 2019 17:51:46 +0000
Received: from BY2NAM01FT005.eop-nam01.prod.protection.outlook.com
 (2a01:111:f400:7e42::203) by BN3PR03CA0077.outlook.office365.com
 (2a01:111:e400:7a4d::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 17:51:46 +0000
Received: from ipmx3.colorado.edu (128.138.67.74) by
 BY2NAM01FT005.mail.protection.outlook.com (10.152.68.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384)
 id 15.20.2347.16 via Frontend Transport; Wed, 9 Oct 2019 17:51:45 +0000
Received: from mx.colorado.edu ([128.138.67.77])  by mx.colorado.edu with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 11:06:44 -0600
Received: from vger.kernel.org ([209.132.180.67]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 10:35:47 -0600
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand id
 S1731778AbfJIQfq (ORCPT <rfc822; michael.gilroy@colorado.edu>);
 Wed, 9 Oct 2019 12:35:46 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:50796 "EHLO 
 heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by
 vger.kernel.org with ESMTP id S1730546AbfJIQfp (ORCPT       
 <rfc822; linux-kernel@vger.kernel.org>); Wed, 9 Oct 2019 12:35:45 -0400
Received: from 188.31.199.195.threembb.co.uk ([188.31.199.195]
 helo=fitzroy.sirena.org.uk)        by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)        (Exim 4.92)       
 (envelope-from <broonie@sirena.org.uk>)        id 1iIEw5-0005Em-A6; Wed, 09
 Oct 2019 16:35:37 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000) id 19E0BD03ED3; 
 Wed,  9 Oct 2019 17:35:35 +0100 (BST)
Authentication-Results: spf=none (sender IP is 128.138.67.74)
 smtp.mailfrom=vger.kernel.org; 
 o365.colorado.edu; dkim=fail (signature did not verify)
 header.d=sirena.org.uk;o365.colorado.edu; dmarc=fail action=none
 header.from=kernel.org;
Received-SPF: None (protection.outlook.com: vger.kernel.org does not designate
 permitted sender hosts)
Authentication-Results-Original: mx.colorado.edu;
 dkim=hardfail (signature did not verify
 [final]) header.i=@sirena.org.uk
IronPort-SDR: Hg0GiI5374FFoq9eqfoS4fjL+Mza/MsuM5LKJJQaNfFjyDYZvkLguJGZT/YMCKzfskhWqtSY3H
 qBfqMah5qCGbrHP2Hwp32BTUFIONQTbzg=
IronPort-SDR: 6b+YjAO8EoooDe/XZOjLdATWW+/k7s41wswFNRaH0If6rFOycrmahxe9upWGiMvbJFKj4elleq
 SB8JE3NQFFaA+hRAJBewXhRmLTZW/5Xgg=
IronPort-PHdr: =?us-ascii?q?9a23=3Arhf73xS5MEP6ANIRmp8x1PKzotpsv+ypbCI2y7?=
 =?us-ascii?q?9ipqxHdrmq45XlOhOOv6dz2QaaFYyO8elNzvHWuvq9Bz9I+MONtmtFbIxQBF?=
 =?us-ascii?q?cO3N8bmwUwDcLCE0D/Je7nY39ffowKHBcttznzPR1OGdzzYVSUpWe9qyMRSV?=
 =?us-ascii?q?3kYFAtf7utStePysS60+G14IXTbh9F13K9NJJ0aS+7tQHA8/UR06BlLLo8zA?=
 =?us-ascii?q?eMnmpQdrYzpysgbRrb1160w+aV0dtd/j5LuvUnpfRNX6jgcqIzQKcKKTk9KG?=
 =?us-ascii?q?k66YjKmUv4UAGN63AAAE4dwCZPUSbf6xSocp7tv3nBu+xx1TPIB8DuSaFxZT?=
 =?us-ascii?q?PwisUjAFegwG9PfxU+9n3ajNA1sLhSpgmvqgY67ojfZ42UMvUsVaTbYd4cWS?=
 =?us-ascii?q?9gcpR6UCpdD4WgKqcCFOEbPP5Ero779WEDtha4GUyADf/imFoqzje+leVym6?=
 =?us-ascii?q?wbHBrL2hBlMcgJtSbuoc74MrtXau2zwKTSnw/OdP5QxXLB79ryfwssp+3Jdr?=
 =?us-ascii?q?kiS8fKxE8zUibIlU6ZpoGgHh/H8uUWry2647gFN6rnwyZv40k5hjm02oIMh4?=
 =?us-ascii?q?3R1KYU0UyByCNi3YwuLse5QkMpRd+/DN5rqiuBPJF3SM5wZ2BzpGMCzaYa67?=
 =?us-ascii?q?q6ZzRP74shygSNT/2cb82h+BnjVficclIazDotMPr3z176+0j1zfLwWOa6yE?=
 =?us-ascii?q?ZatCl+m4LGm0Im3Drpy/iKQfUnpnWG2w6u0yfUz75IL0JurP+IY5R00q4/z4?=
 =?us-ascii?q?srqkOeDDPP33mpjYOVJxU6/Nm0yYGFKv2u7tfUf8dlrCHSAKkHq/euOOsZKQ?=
 =?us-ascii?q?gVdlK93sDl+qTIxG37GYtDvsVxnove65/nFOMq+refMylXwNYB8x2vLRql/s?=
 =?us-ascii?q?47pVMmInRkZU6iibXrEQn+Z5WaRb/3yxzk2H9u3dSeLJ/OHoTXckn5uuq+Y6?=
 =?us-ascii?q?9h6mhNmQkeytscupF5BZoHP9btXk/NidDYChYzbBGe38vNBtFS/6AccnrTGb?=
 =?us-ascii?q?eHK4j+kXLdtao/ZuiWY4kNvyzhbuIo/OPqkSo5kEURc6Co2chfeDW5BPNgO0?=
 =?us-ascii?q?KDfT/hmM0GCzIRvwU4RfD3klDKXT9fL3C1Q+oi6ys6BpPuPonCQImpte/bhn?=
 =?us-ascii?q?WSA4FWa2ZaC1uFDXbvccC+VuwRbD6Jcp4zlyxCXr+lTJUo2RbouQPnmPJrLe?=
 =?us-ascii?q?vRry0Rr57t3dlxr63IlB40/CBpFcnV32CBB2dzgisWSiU30rE3kkJ8zF6H5O?=
 =?us-ascii?q?kwg/FRGdFJofIcehw7L5Paxqp9Ed+0RwHM?=
IronPort-PHdr: =?us-ascii?q?9a23=3A/cEV0xcYzqBY+/PDo2OyosSIlGMj4uimEi00z9?=
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
 =?us-ascii?q?+gYG0t15Iq3Uz7auebNqGS6RLiSuvCRFUwzDotMPr3z1648R2n1eHyeceswE?=
 =?us-ascii?q?ZQrRFMydPhhFsG8Sby2sWMRKElzGCj4ReL8Af2te1KIxoNwPmTIcsx0rFph6?=
 =?us-ascii?q?IIthnRAhaxpBr3oKzHJlsiy/SKjoavKv2u7tfUf55Sqi3MP40fod2GDsUjMh?=
 =?us-ascii?q?MnZU683b2SzZba3U+gfrx6tro6sK6Cv63rAvVHv4iJJQ1HgqQ74AadIjSIyv?=
 =?us-ascii?q?cgt1gJCnNYJDeBsorDY2GJRZKwRb/3yxzk2DJx46jUHJL9E4+RH0Lpzej/ZK?=
 =?us-ascii?q?p8zV8Nyyc0xpMC5L9bIbceBOz3WnPMuNzcBxVmLiao7szpDPpU9YE1QT6UGr?=
 =?us-ascii?q?GCG4/ynArbrvJqIvOLYpcSoiq4MfU++vry2H8wg1MTdKitjtMHLXGiGfJ+JF?=
 =?us-ascii?q?+FJHf2mNAbRHwLsQw3UPHwhRWOUDIbYXGuF7wx/DA1GcqVA4bFT4SY0+bbjg?=
 =?us-ascii?q?6mAp1bYHxHAVmQEHDuMr+JQOoIdDnCc51kgnoPUrymUYYt0lejuBKpg7ZkL+?=
 =?us-ascii?q?+B+iQCuZzq1dw9p/bSmhc76SFuAoyR0m3FSWZo1n0FXT44zehMr017w1O2kO?=
 =?us-ascii?q?B4jvVUGMYV5qZhSQYgOJjVietgBJbvWQ8=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0HxAABLGZ5dYU1DioBlGQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBEQEBAQEBAQEBAQEBTYEugW8sBSQCgUsqjSWFWk0BAQEBAQE?=
 =?us-ascii?q?GU2OBIohWkTAHAQEBAQEBAQEBAwUtAgEBAYcRIzgTAgEBAQkBAQEDAQEBAgE?=
 =?us-ascii?q?FAgEBAgIDGBYGhV8MhDAsDVRkBgECJBkBASoKAwEFCQEBCiETEgMMBRgxGIM?=
 =?us-ascii?q?eglIlBLFXM4J+AYczBwkggRSBU4o7GHiBB4ERgxI+ijAEnlCOc4Isgi+SXgw?=
 =?us-ascii?q?bmUCoC4FpgXszGggoCIMnUBAUgU8MF4tKglpCMYEIkBMBAQ?=
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FIAABiEp5dh0O0hNFlGQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBEQEBAQEBAQEBAQEBTYEugW8sgUQxKo0lhVlTBlNjFIEOiFa?=
 =?us-ascii?q?RMAcBAQEBAQEBAQEDBSwBAgEBAYcRIzgTAgEBAQkBAQEDAQEBAgEFAgEBAgI?=
 =?us-ascii?q?QAQEBCgsJCCmFNAyEMCwNVGQDAwECJBkBASoKAwEFCQEBCiETEgMMBRgxGIM?=
 =?us-ascii?q?dAYF2FASxXjOCfgGHMwcJgTSBU4o7GHiBB4ERgxI+iioEnlCOc4Isgi+SXgw?=
 =?us-ascii?q?bmUCoC4FpgXszGggoCIMnUBAUgU8MF4tKglpBMoEGAQGTXQEB?=
X-IPAS-Result: =?us-ascii?q?A0HxAABLGZ5dYU1DioBlGQEBAQEBAQEBAQEBAQEBAQEBE?=
 =?us-ascii?q?QEBAQEBAQEBAQEBTYEugW8sBSQCgUsqjSWFWk0BAQEBAQEGU2OBIohWkTAHA?=
 =?us-ascii?q?QEBAQEBAQEBAwUtAgEBAYcRIzgTAgEBAQkBAQEDAQEBAgEFAgEBAgIDGBYGh?=
 =?us-ascii?q?V8MhDAsDVRkBgECJBkBASoKAwEFCQEBCiETEgMMBRgxGIMeglIlBLFXM4J+A?=
 =?us-ascii?q?YczBwkggRSBU4o7GHiBB4ERgxI+ijAEnlCOc4Isgi+SXgwbmUCoC4FpgXszG?=
 =?us-ascii?q?ggoCIMnUBAUgU8MF4tKglpCMYEIkBMBAQ?=
X-IPAS-Result: =?us-ascii?q?A0FIAABiEp5dh0O0hNFlGQEBAQEBAQEBAQEBAQEBAQEBE?=
 =?us-ascii?q?QEBAQEBAQEBAQEBTYEugW8sgUQxKo0lhVlTBlNjFIEOiFaRMAcBAQEBAQEBA?=
 =?us-ascii?q?QEDBSwBAgEBAYcRIzgTAgEBAQkBAQEDAQEBAgEFAgEBAgIQAQEBCgsJCCmFN?=
 =?us-ascii?q?AyEMCwNVGQDAwECJBkBASoKAwEFCQEBCiETEgMMBRgxGIMdAYF2FASxXjOCf?=
 =?us-ascii?q?gGHMwcJgTSBU4o7GHiBB4ERgxI+iioEnlCOc4Isgi+SXgwbmUCoC4FpgXszG?=
 =?us-ascii?q?ggoCIMnUBAUgU8MF4tKglpBMoEGAQGTXQEB?=
X-IronPort-AV: E=Sophos; i="5.67,277,1566885600"; d="asc'?scan'208";
 a="369361849"
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="asc'?scan'208";
 a="369284676"
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
 bh=owdfGfpxxrkSa3bEZCcNRIXecf20ZOjPIlOoM7dfj2Q=;
 b=xxg1yPso5ztQ/T7iDk98vnYtJ       
 yNHDZeAYSyQgIshsARNOL1FqCQHj1VaXP/dJo3gUYOY4qNXNjz8JpcxJEkFrKPBIfNIu4MnUjB0X/ 
 mrL0zJGtyr4YRB57vqtiNy9kEoc+5kEgCnwLvlhTUdhlab7uBtEBflGAKjCp4spvsCDHE=;
Date: Wed, 9 Oct 2019 17:35:35 +0100
From: "Mark Brown" <broonie@kernel.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@linaro.org>
Message-ID: <20191009163535.GK2036@sirena.org.uk>
References: <20191009085108.4950-1-srinivas.kandagatla@linaro.org>
 <20191009085108.4950-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20191009085108.4950-3-srinivas.kandagatla@linaro.org>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
X-MS-Exchange-Organization-ExpirationStartTime: 09 Oct 2019 17:51:45.9568 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: fc53f8ba-f557-4c83-50a2-08d74ce15a1f
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-Forefront-Antispam-Report: CIP:128.138.67.74; IPV:CAL; CTRY:US; EFV:NLI;
 SFV:SKN; SFS:; DIR:INB; SFP:; SCL:-1; SRVR:CO2PR03MB2184; H:ipmx3.colorado.edu;
 FPR:; SPF:None; LANG:en; ; SKIP:1; 
X-MS-Exchange-Organization-AuthSource: BY2NAM01FT005.eop-nam01.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: colorado.edu
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc53f8ba-f557-4c83-50a2-08d74ce15a1f
X-MS-TrafficTypeDiagnostic: CO2PR03MB2184:|CO2PR03MB2184:
X-MS-Exchange-Organization-SCL: -1
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 17:51:45.6626 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc53f8ba-f557-4c83-50a2-08d74ce15a1f
X-MS-Exchange-CrossTenant-Id: 3ded8b1b-070d-4629-82e4-c0b019f46057
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3ded8b1b-070d-4629-82e4-c0b019f46057; Ip=[128.138.67.74];
 Helo=[ipmx3.colorado.edu]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2184
X-MS-Exchange-Transport-EndToEndLatency: 00:57:18.5314385
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2347.014
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; ex:0; auth:0; dest:I;
 ENG:(750127)(520002050)(944506383)(944626516); 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xEguiPzT1K/ZTwr20WupzjzpoXbPQBfI34AkKNlhaQqDzapxzQOB4UpePCs0?=
 =?us-ascii?Q?n68RSyMXxIrBKskFjwFiCOY3uR+N+oSZqizP39gQUM9E3idjqj11PLN3Lt6Y?=
 =?us-ascii?Q?3orPIvjC+PWpeyHMAf3akqNK5GGX/Rw4l6umZ1YISFhXom8456Ck4ctGqLHS?=
 =?us-ascii?Q?wMgpbMcZMv/EWBoh/zfHX4RB+do5FCecRxqt6xno6GefrCPij63scsv51kqp?=
 =?us-ascii?Q?0eKQWUCP3sT83J9TMY2kwa5KDEQlY/xHl7Bz+l02D8svcVlbF/DjhpGtdzVW?=
 =?us-ascii?Q?NVGNARcp05P5LtOK9Q96Tmoa4NYZ2dFx+nH19cuQj/wziSmAk6sGcMckyZk2?=
 =?us-ascii?Q?+uh41gGXlayG6yqQOeOr4zel2JvsIKLOKL2Sv603FU9sic+VqRoFTcSwKpid?=
 =?us-ascii?Q?Pp4xd6fkos0VLOGfuQlwIEkF8XjHN8kC90VFCQ+5o8wdv4SPGSFKeGMo3Nvn?=
 =?us-ascii?Q?cAiSUa5pCiM87qS0/MPnm2uQ7P9iBBDHJGpbm/XnT0ivcAwdTU8W/3SsDm5t?=
 =?us-ascii?Q?cal5gwwqKdmJkWszAyIF4COG8K2vZAKCQNLYqTbDoerDiVqvzCnXjK3DEKxH?=
 =?us-ascii?Q?1VxAJHleo9uw2nPYP6OpRpURdwMvWFgT0wNSQ8cQNwktt1Kf4kGWRs/LXQ/6?=
 =?us-ascii?Q?5kV55hmSI94O4VUs09ZT+BHfH+Zpal/74FKhRUb/IjoWjHDt8wnAjhnIjXGo?=
 =?us-ascii?Q?iGPO04IP6+d9Ajw80SfDfolbShWPi7RWymMlbZwKdE7F7LPHIecqiiSJF+eX?=
 =?us-ascii?Q?Sdk8JdH/W71kc2dqyO4NlqSgKfN/0piUHxFMiYuBAHBSFSt3bDXRlOBrYIJu?=
 =?us-ascii?Q?zcZ2Vpm8yF+tnnr589Ul0JV693mzRn2ajM9HkNG1uWoUKUDLRlgKHAUh3g9+?=
 =?us-ascii?Q?8EDuf+B9qz9xjV0OncB7DMmOKTDe0YCBWRdTupMYYHWFc+Yc3hInEjBIQ+5n?=
 =?us-ascii?Q?cKhjD++rLVvAKgabYGhuDn3HvCnhzTAYGa07/FzzL6G2u5FVdnzXGn4j4OwX?=
 =?us-ascii?Q?cLzNDQD5KjkdegHpGjdVfaXscKKlDDpvo2MVwoKYNf87F2RN8XtLVglGdooa?=
 =?us-ascii?Q?UzQCQkTDsr4oT+59mHUrBVK5Wwvch3wfVJO0UiHscB0hox16zFY=3D?=
Content-Disposition: inline
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "spapothi@codeaurora.org" <spapothi@codeaurora.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v7 2/2] ASoC: codecs: add wsa881x amplifier
	support
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

On Wed, Oct 09, 2019 at 09:51:08AM +0100, Srinivas Kandagatla wrote:

> +static const u8 wsa881x_reg_readable[WSA881X_CACHE_SIZE] = {

> +static bool wsa881x_readable_register(struct device *dev, unsigned int reg)
> +{
> +	return wsa881x_reg_readable[reg];
u
There's no bounds check and that array size is not...

> +static struct regmap_config wsa881x_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 8,
> +	.cache_type = REGCACHE_RBTREE,
> +	.reg_defaults = wsa881x_defaults,
> +	.num_reg_defaults = ARRAY_SIZE(wsa881x_defaults),
> +	.max_register = WSA881X_MAX_REGISTER,

...what regmap has as max_register.  Uusually you'd render as a
switch statement (as you did for volatile) and let the compiler
figure out a sensible way to do the lookup.

> +static void wsa881x_init(struct wsa881x_priv *wsa881x)
> +{
> +	struct regmap *rm = wsa881x->regmap;
> +	unsigned int val = 0;
> +
> +	regmap_read(rm, WSA881X_CHIP_ID1, &wsa881x->version);
> +	regcache_cache_only(rm, true);
> +	regmap_multi_reg_write(rm, wsa881x_rev_2_0,
> +			       ARRAY_SIZE(wsa881x_rev_2_0));
> +	regcache_cache_only(rm, false);

This looks broken, what is it supposed to be doing?  It looks
like it should be a register patch but it's not documented.

> +static const struct snd_kcontrol_new wsa881x_snd_controls[] = {
> +	SOC_ENUM("Smart Boost Level", smart_boost_lvl_enum),
> +	WSA881X_PA_GAIN_TLV("PA Gain", WSA881X_SPKR_DRV_GAIN,
> +			    4, 0xC, 1, pa_gain),

As covered in control-names.rst all volume controls should end in
Volume.

> +static void wsa881x_clk_ctrl(struct snd_soc_component *comp, bool enable)
> +{
> +	struct wsa881x_priv *wsa881x = snd_soc_component_get_drvdata(comp);
> +
> +	mutex_lock(&wsa881x->res_lock);

What is this lock supposed to be protecting?  As far as I can
tell this function is the only place it is used and this function
has exactly one caller which itself has only one caller which is
a DAPM widget and hence needs no locking.  It looks awfully like
it should just be a widget itself, or inlined into the single
caller.

> +static void wsa881x_bandgap_ctrl(struct snd_soc_component *comp, bool enable)
> +{
> +	struct wsa881x_priv *wsa881x = snd_soc_component_get_drvdata(comp);

Similarly here.

> +static int32_t wsa881x_resource_acquire(struct snd_soc_component *comp,
> +					bool enable)
> +{
> +	wsa881x_clk_ctrl(comp, enable);
> +	wsa881x_bandgap_ctrl(comp, enable);
> +
> +	return 0;
> +}

There's no corresponding disables.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
