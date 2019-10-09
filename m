Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAB2D53A2
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Oct 2019 02:55:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40A1F1674;
	Sun, 13 Oct 2019 02:54:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40A1F1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570928103;
	bh=OPvDhc+kYTDwftnAdg460PiFhqugyZQRMtIdvl9tH2g=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uvPRdQwrmXKk7joiBU4nB5Ti+SHRDIVBoZoKvAcEkZABwIdJUFT+h7kQ1Qxox5sk9
	 AQrYHiItj1XXGofQ02+dw1oS4hqWmoR6tIRcxqR+Vu2QtRLKVl1pQc1FXsN9JyDYPN
	 8/FoiYHb24UaqUURAMplSIJ0QLidYELRTjb6Vmq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 722D0F8036D;
	Sun, 13 Oct 2019 02:53:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4629F8038F; Sun, 13 Oct 2019 02:53:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from listssympa-test.colorado.edu (listssympa-test.colorado.edu
 [128.138.129.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D3E2F800DA
 for <alsa-devel@alsa-project.org>; Sun, 13 Oct 2019 02:53:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D3E2F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=linaro.org header.i=@linaro.org header.b="HaBfOFrH"
Received: from listssympa-test.colorado.edu (localhost [127.0.0.1])
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/sympa) with ESMTPS id
 x9D0r0Xe000903
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 12 Oct 2019 18:53:00 -0600
Received: (from root@localhost)
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/submit) id
 x9D0qx4a000892; Sat, 12 Oct 2019 18:52:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google; 
 h=subject:to:cc:references:from:message-id:date:user-agent 
 :mime-version:in-reply-to:content-language:content-transfer-encoding; 
 bh=bDqDxoFy92WA4ghkXv1lx9zPC55ecQKMRynuRGpc+u0=;       
 b=HaBfOFrHa9oyt36nChd39PrJeZUuOjiwkLqEufxO0FDeZaAM8pWk3w4qC1FGJOimkU        
 6wWBfq2FQ/2E8UwhSjPpYWlZ+oBCdv6+FSOJIHJg4+UDLU1RVGiSXws/q5x6ExjaEtfU        
 zY6UQfEr64W+A634cyy+tMjAFKqRE7kRsq7zQNtKYkuOe0Fk/sI/R66Q9wnewpNnPv5i        
 YFish3WqSGpPEY6BlBJU4lqY8vkSGrKW0vVc6bHEhhpKx/OJhUGrnSdSK/7dpNia+Piu        
 RBrnot2SiL8iXKl9WrBpL0hG05qmasETpP59f8VRzgfBv2358jKef340rHlceZw20cVW        
 r4QQ==
Received: from CO2PR03MB2326.namprd03.prod.outlook.com (2603:10b6:a03:c0::31)
 by BYAPR03MB4376.namprd03.prod.outlook.com with HTTPS via
 BYAPR05CA0018.NAMPRD05.PROD.OUTLOOK.COM; Wed, 9 Oct 2019 18:41:16 +0000
Received: from CY4PR03CA0015.namprd03.prod.outlook.com (2603:10b6:903:33::25)
 by
 CO2PR03MB2326.namprd03.prod.outlook.com (2603:10b6:102:a::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
 id 15.20.2347.16; Wed, 9 Oct 2019 17:44:51 +0000
Received: from SN1NAM01FT049.eop-nam01.prod.protection.outlook.com
 (2a01:111:f400:7e40::205) by CY4PR03CA0015.outlook.office365.com
 (2603:10b6:903:33::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 17:44:51 +0000
Received: from ipmx2.colorado.edu (128.138.128.232) by
 SN1NAM01FT049.mail.protection.outlook.com (10.152.64.252) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384)
 id 15.20.2347.16 via Frontend Transport; Wed, 9 Oct 2019 17:44:50 +0000
Received: from ipmx4.colorado.edu ([128.138.67.75])  by mx.colorado.edu with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 11:00:41 -0600
Received: from mx-spsc.colorado.edu (HELO mx.colorado.edu) ([128.138.67.77]) by
 mx.colorado.edu with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2019
 10:34:00 -0600
Received: from mx-spsc.colorado.edu (HELO mx.colorado.edu) ([128.138.67.77]) by
 mx.colorado.edu with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2019
 10:14:04 -0600
Received: from vger.kernel.org ([209.132.180.67]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 10:01:07 -0600
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand id
 S1731673AbfJIQBG (ORCPT <rfc822; michael.gilroy@colorado.edu>);
 Wed, 9 Oct 2019 12:01:06 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34852 "EHLO       
 mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org       
 with ESMTP id S1731375AbfJIQBF (ORCPT       
 <rfc822; linux-kernel@vger.kernel.org>); Wed, 9 Oct 2019 12:01:05 -0400
Received: by mail-wr1-f65.google.com with SMTP id v8so3694243wrt.2 for
 <linux-kernel@vger.kernel.org>; Wed, 09 Oct 2019 09:01:03 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net.
 [86.30.250.44])        by smtp.googlemail.com with ESMTPSA id
 q124sm3600028wma.5.2019.10.09.09.01.01        (version=TLS1_2
 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);        Wed, 09 Oct 2019
 09:01:01 -0700 (PDT)
Authentication-Results: spf=none (sender IP is 128.138.128.232)
 smtp.mailfrom=vger.kernel.org; 
 o365.colorado.edu; dkim=pass (signature was verified)
 header.d=linaro.org;o365.colorado.edu; dmarc=pass action=none
 header.from=linaro.org;
Received-SPF: None (protection.outlook.com: vger.kernel.org does not designate
 permitted sender hosts)
Authentication-Results-Original: mx.colorado.edu;
 dkim=pass (signature verified)
 header.i=@linaro.org
IronPort-SDR: pU+X4oeeW1LEqomdKa9xsMa/9JC1epzj97k7vQ6iNLIoFYiuHI9uQaaE4jOtCMrMP9O6YNatgN
 feKXdp4FXnCRmfgE9rwOTXCUObpbpY2Tk=
IronPort-SDR: nHxDhBAZrMbu26G8fhQoDbKKBAANEOxWVbdvY8Ttd4SZnBUv+frXblwVEdwd3rd7YN68tT14PP
 IW0SEOCvlxAB9sEzlutyBfzrw8rU/Rd7c=
IronPort-SDR: NkKvt+jwoA9X7iMi4AZT4mRsgOyAKnxNURDiOCg/CjeIkopkJDI/QKFjtsB6S1r9dumOE4fxtx
 ybcRbBfVBqhEq5tpjmHYpxRbvbbcOWakM=
IronPort-SDR: urRNiApSKz3wz0zIalO+nAm1v57uCkfiL/bwk9nYsHwlRPh7qiKxHCfWML3r3V7icVQr3nAhgC
 gKAsBaayuDZBvnFC9BXhaTRshxL4QmqBI=
IronPort-PHdr: =?us-ascii?q?9a23=3AYG9eyBy9AcNJ0ArXCy+O/D0hRQkC/pjqNwoI44?=
 =?us-ascii?q?YmjLQRK/7x4cG7bwTWsO92hRrSXYyBtqwXw+GDqa3kUHwN7dGbvXQLYJFABH?=
 =?us-ascii?q?pnwY1e10RoSIaJXEn6KvfwaGo9BssRHEQw8Ha8PkxYS6OcLxWa6jX6pXYSTw?=
 =?us-ascii?q?7iPwh4LfinBomAhM/lze289ofeZQ5Fn2ize7R3fhC7th7YucRTgIcwJq8tx0?=
 =?us-ascii?q?nUuXZSPu1ZyGV0QDDb1160ro/4tNYx9iVVtrc/+tRbUKL8LaU+CKZVFDA3dn?=
 =?us-ascii?q?wytsbsswXOSxfK4nIaXXgfnRcaCA/D8Bz8QtLtqCL8reRwwmyXO8bxQbEyVm?=
 =?us-ascii?q?fHje8jAFegwG9PPT5s+k3Optx3orMK+i2I+xN/wL7KOYWFZehGVf6AcNgjZk?=
 =?us-ascii?q?97T8BMbQNZCcChN95caohJda4Q58G171FbjRKUCy6CHsPmmzhZmiSo24Y637?=
 =?us-ascii?q?9wKRvk0T4dAvUMsWvXiMzYKakCdrib4KT6xBzmP+tp2mzitJHjKz4Og9aNWL?=
 =?us-ascii?q?FNFKiZgQFnX0uNxh3OtrPPMSrP+N1K6UXL0vVgbuCXk18YrzMypRKEytlyya?=
 =?us-ascii?q?fyoaA06nLLqWZE7KIIfOeGZ09AUcG/V4INp3+3J4l/b98sfgQK8G5ygvVO8d?=
 =?us-ascii?q?bzbhlU9a0p6gSBN8PEWtbTvhnyRaWNBDVRqlF8Qp/ghCyp6Bey88vgdfi3zX?=
 =?us-ascii?q?FH9gRG1cLt8UpTiSWC9c6KVeNb+H+/hDfqtUiboqkMaQh83Zv1KoUhmYEprb?=
 =?us-ascii?q?ULiWnyQAXysmfL0KuPRxU6+dOH8cfYOqvYrcGWF6J0ihndIuMJuMyCLv4+CQ?=
 =?us-ascii?q?Q1fC/E9fya1bSgxUzkJdcCxrV+2uGR+NjgD94dobLjOA5xgocTyBLuMC2MyP?=
 =?us-ascii?q?BAnVZfcUtAcQmqs5DRZgDAcM7CH/ixqUr2y2o7xdPLMOa9Wo/tKnPOoqi7Jb?=
 =?us-ascii?q?1D1Cs+gEJ7hZgXr9ocEO04GaemCQfh8d3CCRkhNBaohvzqE8h5ytYGUHmUUf?=
 =?us-ascii?q?XDYorPrV+F4P4uKOCQZYgT/QzwMOUh++Ww3S08iRkWeq2ux5Ibbza1Euk1a0?=
 =?us-ascii?q?maYH+5mt4aCi9KpQsxSuX2lUePGSBefXe8Xq8wp3k7BYuqAJ2FR9WFhL2H1T?=
 =?us-ascii?q?28WJpMaW0=3D?=
IronPort-PHdr: =?us-ascii?q?9a23=3APGmr1xUZlwquDMPaVwKbRnc17RDV8LGtY1w5yb?=
 =?us-ascii?q?sCzp9Qe6C+9ojjO0qAvK8/kgqQDs3Svuhfgq/Ns6m6BDJTqZ3Uqn0GeYxBW1?=
 =?us-ascii?q?gfhMEfjwEsU6vnQQWzZLaiJ2Q2ScBDUlZ/+De8K0cGUN2raFrVrXm/vltwUl?=
 =?us-ascii?q?23fUI9bqz1T5XPhca63Pzg55qBaA4anjezbKl/Kh67tlffrM4T045vMb04xR?=
 =?us-ascii?q?aMo3cad+1KyDF1Pl+J2h/z68Gsmfwru2wY87ppv4YSVKT/cuEmQKZDDTMgYW?=
 =?us-ascii?q?EzodfmrR3SCBeItHAbVHkblAYNBwHD4wzzUZqjuSz8qud7xGyGJ8TwVr45Q3?=
 =?us-ascii?q?Gv6axsRB7uh3RiVXZxuCmfwoQ4hqIOqj64iwx47Z+FOr68aPV+fZPDJNcKFH?=
 =?us-ascii?q?h5dZsMWid4IaaGfo0SNcUZNqVF99yuwjlG5VP2TUHkTOm66jZiiFjYx40zgu?=
 =?us-ascii?q?MwDVqY2icgE4lfiG72oefIKYAQUP+26LDl0DvTSKt49TrP4aHtIggeoqqTAa?=
 =?us-ascii?q?tbKOT+624uEgD46zfY4cStd3vdnqxTrFex4fM6e9vo0UN3lh5xmTqX3vYTjr?=
 =?us-ascii?q?uKgag+xk6atgtC56QUBf+3FA1GTfqZSaFumCChB5RtBdp/Uz9FqCQz56EIhP?=
 =?us-ascii?q?vZNGBCgNxvj1aXec3ZTrGGzwi9CNnSCGkj2Hl0afGjohSb32u58MCjVfOvyQ?=
 =?us-ascii?q?lYlwxZsejPq1cAjzLQrdOmDcEjoH7wxjCCyBj17NlafEFR9+KTY9ZpivZ43q?=
 =?us-ascii?q?s9sF/DRRDvo2rutIKnKG8g0MqVt+D+U+X4paSzLaxL0h/AOfokuuG/AfwbIk?=
 =?us-ascii?q?8pfWim1v6677HY3gqmTK1sj/R1qqjE1fKSbYxT7ubxS0dv+Jwl7ArlNDaCgN?=
 =?us-ascii?q?Uovn1WE0hvYDbfj6exZkjLKevVMe+H3gWiwAlR1f/IFKO7WcidLFvOnuy9Ja?=
 =?us-ascii?q?xd70VR+hVpldth2Pc2QvlJaLq7Ege5roDhN0psYESkhuf9D9Nl0ZkCHHiCGb?=
 =?us-ascii?q?KdLPbKuESTtbh1ccCReI8Yvir8IPE55vnoyEU0gkIZYbL3jckSeDazGfBhOU?=
 =?us-ascii?q?yVZjzhjspSWWsJvw9rVOXxkxXCSj9cYX+uQrgxri82EoOoDIrPB8itjbWN0T?=
 =?us-ascii?q?39H8h+YmFAA0qLV3DyeIg=3D?=
IronPort-PHdr: =?us-ascii?q?9a23=3APXkmGxc7wba2pHHvwNzYa5h9lGMj4uimEi00z9?=
 =?us-ascii?q?8KlbtKb62//pPkYxWFt+s41QyBVNDB8PsBkOrf6f2+CiQLtIyMtHkSfZALTR?=
 =?us-ascii?q?IBgNUbk19FYobNQQWzZLaiY3k+HcJLTlgj+Gu0YgBOTcn5YFLWry7Xj3ZaUl?=
 =?us-ascii?q?23fUI9JrHuB4TQgs+rhfy1qZbYMR9FijenbLV5IQ7kox/Ws5sTjJB5I6k8jx?=
 =?us-ascii?q?rF8HdBZ+kE2HhlPxeakBv6+qLStNYru2wY87pppctBVKi/YakiVr1fCmYnNS?=
 =?us-ascii?q?Uv6dXvpFzfSlmE4X0AX2MK1x5BBQfY5R73DJz2tDf3sPY4xDOTO9b4QKpxVD?=
 =?us-ascii?q?Kp6KtqThC77UVPf3ZxuCmfwsZw2ah3uT6xoDJuktTrSd2aNPlOYPrZbYIIfU?=
 =?us-ascii?q?EcA8tabg9kOJK6crEgF+FCIL4N/Oyf7xNG5VP2TUGmUcPm4DFvqGXW1Pw9wv?=
 =?us-ascii?q?h6Twft3AB7TuoUknnmkcjSNqYNUsSs4bTG3RKbQd9b6z7UzdjQTRN6vq2Vdu?=
 =?us-ascii?q?teXuj2yEwsKmanxh3Y4cStd3vdiPsymWaCtcRZEriC21M4qzpzmiCe+cMeyY?=
 =?us-ascii?q?7jrY4LlBPqzgJb4aYXKoH7dWJfXIeeLrRRjBGFLMxvH9N8bnFqsQsmxIBj29?=
 =?us-ascii?q?bzNGBCgNxvjwzuNcG+faWSvE7cF8/PemtzlWMmZJe9rjiR6HKNle7GTdDrwm?=
 =?us-ascii?q?9ssgl0kcTruygj1FvIy4+9FKVEr1in1CmX8Qbr9LxFRCJ83eKTY9ZpivYBuJ?=
 =?us-ascii?q?sIsR/8BxTZgH3bvfG8cm8Gx7Ss8tW3fLbdiYW/CNdqtAqgOIQDmsynIvR/FS?=
 =?us-ascii?q?oOYkeB/9+w756kokHhZrRDzcU3j8y7+NiSbYxT7ubxOSVP1IE/sS2+K2en4P?=
 =?us-ascii?q?cczEYdBkphIBKo19XwPljVDczgNarujQSSqiVkydrYZOa8UpfuI3aYzO/7Xb?=
 =?us-ascii?q?J25nxDklI48+86hdocQvlJaLq7ElWtjeWNW0xxI0m12eHhENJnysYEVHmSBr?=
 =?us-ascii?q?PMKKrJqgzSvLAGPvWMaYkJuT30N/ki4bvUgGQknUMGI/n72ItRY3e8Ge5vL0?=
 =?us-ascii?q?LfbHbx0Z8NEmYP6xI3V/eiyEaDXjhae2uoUuoi6ys6BoOrAcaLRo2kjLGbmi?=
 =?us-ascii?q?buNplXYGlcDRaLC3jl?=
IronPort-PHdr: =?us-ascii?q?9a23=3A1JN3mxbLYUFm7mgJzp0A66T/LSx+5ufYHS8wr7?=
 =?us-ascii?q?c5grZTe7ii+JK9ZRaN+6A03xfACJ/A4rdfi+OM7v6zEWdV+5uFuWAPfNtWWh?=
 =?us-ascii?q?sMmcgazGlCSIbNQQWzZLbmOig7Gs1YUxli5X7oeVMAF8H5aFnf8RjQpXZaUl?=
 =?us-ascii?q?23fUJ1c//oEIzfhNjly+fg8JaBeQhGiSCwZ7h/N0e4twLU5MwbmpBrJat0yx?=
 =?us-ascii?q?ebrnJUdrZL3m5yYFuckhDgg6X4tNYru2wY87pz8s9FXODkcr4jTLteXjUgdn?=
 =?us-ascii?q?o4/Mn68AXEHwCI4GcRVHlTlhNODBXM4xyoVZD3rib8qq9hwiCcJsP7V/U5Xz?=
 =?us-ascii?q?+l46ZtR0yN6m9Pf3ZxuCmfgMwlho5CjAKmiQ0umbH9PI6VN8pgJ6fNLMEibj?=
 =?us-ascii?q?ccU81odAl7E4WhVaQXBKkcZbMLyuu17xNG5VP2TQP5JOrFxBhmnF//jKorz7?=
 =?us-ascii?q?9/FyrG0FdxJ8gsvUbpsfL3NbgRdfmY0afY6m3tQ/5k0B7YuJD3cUs+/einBJ?=
 =?us-ascii?q?xfU+3QzEoScmGNxh3Y4cStd3vLydsnvXHBwdMnD8//tnEnkANJugmQwvVvja?=
 =?us-ascii?q?PiipxLiX7/0gdY4KQ6eZ6FZGpGOOSaP5prhz6BcJIrUp0PU2NhlTo099hk8d?=
 =?us-ascii?q?bzNGBCgNxv1S+BVsWJXpLWvi2gfbjKfTxplTF5XbCWqTWry2X/ydfnT5am6X?=
 =?us-ascii?q?BWjRtGj/7B7l4OkAfyrfLZFMIs4UGsxi6p0TjNt+AhQwh83eKTY9Zpio8el4?=
 =?us-ascii?q?ET6nvaJQDuoGjH0oWSXGcZpuyx2rT5YY7JvLyjb5FKgV/0EokumtScEaMfEA?=
 =?us-ascii?q?gzcHKdwuiH9/q88VXfQbwJtvwr98uR+NiSbYxT7uaDKRVT1Zp50BebXzaW89?=
 =?us-ascii?q?BJomMtNHYdeD3f0pHsMkrjHOjAUKax02qWgjhl7e6cZeCxALbAICOfyK3Beb?=
 =?us-ascii?q?1w2VEGkAEN8rU9r9ocQvlJaLq7QBPIjYmNXVcpdg2uxOD/D89hk5kTQn+LHv?=
 =?us-ascii?q?qBObjJ4gXStMsyP+mBYpMUsz/hKv8josTjlmI9hURDLfuszd0cb3S/BP1qJA?=
 =?us-ascii?q?OUbWe/ytsCEGJfpgMlV6Sqk1yNVzdPemy/F7wx/DA1CY+qTM/DS4mhjabH3X?=
 =?us-ascii?q?KTGpxQb3pBTFeWHno=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FTAACyGp5dbUtDioBlGgEBAQEBAQE?=
 =?us-ascii?q?BAQMBAQEBEQEBAQICAQEBAYFqAgEBAQELAYIaBW9THRIqhCOJAoVagWolg26?=
 =?us-ascii?q?QFYcsAQEBAQEBAQEBBgEBLQIBAQGDLIETglIjNwYOAgECCQEBAQMBAQECAQU?=
 =?us-ascii?q?CAQECAhANCwkGK4U0DIQwLA1UZAEBAQMBAg8RFQgBATcBBQkBAQoYAgImAgI?=
 =?us-ascii?q?DMQEFARwGAQwIAQEBHYMAgngEo3mBAzyLJoEygn0BAQWCSYMtgT8JEnooAYp?=
 =?us-ascii?q?wgR2BWD+BOAyCXz6EWYJ5gl6WK5ccB4IlZgSUKQYCGY17EoszLY4AmTYCBAI?=
 =?us-ascii?q?EBQIGDyOBRYF8fYMvUBAUgU8MFxWIT4VAc4EIkBMBAQ?=
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0EpAABnDZ5dfU1DioBlGgEBAQEBAQE?=
 =?us-ascii?q?BAQMBAQEBEQEBAQICAQEBAYFqAgEBAQELAYIac1MdEiqEI4kCh0Qlg26QFYc?=
 =?us-ascii?q?sAQEBAQEBAQEBBgEBLQIBAQGDLIETgnU3Bg4CAQIJAQEBAwEBAQIBBQIBAQI?=
 =?us-ascii?q?CEAEBCRYIhV0MhDAsDVRkAQEBAwECDxEVCAEBNwEFCQEBChgCAiYCAgMxAQU?=
 =?us-ascii?q?BHAYBDAgBAQEdgwCCCwSkAoEDPIsmgTKCfQEBBYJJgy+BPwkSDmwoAYpwgnU?=
 =?us-ascii?q?/gTgMgl8+hFmCeYJYliuXHAeCJWYElCkGAhmNexKLMy2OAJk2AgQCBAUCBg8?=
 =?us-ascii?q?jgUWBfH2DL1AQFIFPDBcViE+FQHOBCJNdAQE?=
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0EWAABKBp5dfU1DioBlGgEBAQEBAQE?=
 =?us-ascii?q?BAQMBAQEBEQEBAQICAQEBAYFqAgEBAQELAYIac3ASKoQjiQKHRCWDbpAVhyw?=
 =?us-ascii?q?BAQEBAQEBAQEGAQEtAgEBAYMsgROCdTcGDgIBAgkBAQEDAQEBAgEFAgEBAgI?=
 =?us-ascii?q?QAQELFAiFXQyEMCwNVGQBAQEDAQIPERUIAQE3AQUJAQEKGAICJgICAzEBBQE?=
 =?us-ascii?q?cBgEMCAEBAR2DAIILBKNvgQM8iyaBMoJ9AQEFgkmDLoE/CRIObCgBinCCdT+?=
 =?us-ascii?q?BOAyCXz6EWYJ5gliWK5ccB4IlZgSUKQYCGY17EoszLY4AmTYCBAIEBQIGDyO?=
 =?us-ascii?q?BRYF8fYMvUBAUgU8MFxWIT4VAQjGBCJNdAQE?=
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ErAABKBp5dh0O0hNFlGgEBAQEBAQE?=
 =?us-ascii?q?BAQMBAQEBEQEBAQICAQEBAYFqAgEBAQELAYIac1ExKoQjjlyBaiUUg1qQFYc?=
 =?us-ascii?q?sAQEBAQEBAQEBBgEBLAECAQEBgyyBE4JSIzcGDgIBAgkBAQEDAQEBAgEFAgE?=
 =?us-ascii?q?BAgIQAQEBCgsJCCmFNAyEMCwNVGQBAQEDAQIPERUIAQE3AQUJAQEKGAICJgI?=
 =?us-ascii?q?CAzEBBQEcBgEMCAEBAR2DAIILBKNvgQM8iyaBMoJ9AQEFgkmDLoE/CRJ6KAG?=
 =?us-ascii?q?KcIEdgVg/gTgMgl8+hFmCeYJYliuXHAeCJWYElCkGAhmNexKLMy2OAJk2AgQ?=
 =?us-ascii?q?CBAUCBg8jgUWBfH2DL1AQFIFPDBcViE+FQEEygQYBAZNdAQE?=
X-IPAS-Result: =?us-ascii?q?A0FTAACyGp5dbUtDioBlGgEBAQEBAQEBAQMBAQEBEQEBA?=
 =?us-ascii?q?QICAQEBAYFqAgEBAQELAYIaBW9THRIqhCOJAoVagWolg26QFYcsAQEBAQEBA?=
 =?us-ascii?q?QEBBgEBLQIBAQGDLIETglIjNwYOAgECCQEBAQMBAQECAQUCAQECAhANCwkGK?=
 =?us-ascii?q?4U0DIQwLA1UZAEBAQMBAg8RFQgBATcBBQkBAQoYAgImAgIDMQEFARwGAQwIA?=
 =?us-ascii?q?QEBHYMAgngEo3mBAzyLJoEygn0BAQWCSYMtgT8JEnooAYpwgR2BWD+BOAyCX?=
 =?us-ascii?q?z6EWYJ5gl6WK5ccB4IlZgSUKQYCGY17EoszLY4AmTYCBAIEBQIGDyOBRYF8f?=
 =?us-ascii?q?YMvUBAUgU8MFxWIT4VAc4EIkBMBAQ?=
X-IPAS-Result: =?us-ascii?q?A0EpAABnDZ5dfU1DioBlGgEBAQEBAQEBAQMBAQEBEQEBA?=
 =?us-ascii?q?QICAQEBAYFqAgEBAQELAYIac1MdEiqEI4kCh0Qlg26QFYcsAQEBAQEBAQEBB?=
 =?us-ascii?q?gEBLQIBAQGDLIETgnU3Bg4CAQIJAQEBAwEBAQIBBQIBAQICEAEBCRYIhV0Mh?=
 =?us-ascii?q?DAsDVRkAQEBAwECDxEVCAEBNwEFCQEBChgCAiYCAgMxAQUBHAYBDAgBAQEdg?=
 =?us-ascii?q?wCCCwSkAoEDPIsmgTKCfQEBBYJJgy+BPwkSDmwoAYpwgnU/gTgMgl8+hFmCe?=
 =?us-ascii?q?YJYliuXHAeCJWYElCkGAhmNexKLMy2OAJk2AgQCBAUCBg8jgUWBfH2DL1AQF?=
 =?us-ascii?q?IFPDBcViE+FQHOBCJNdAQE?=
X-IPAS-Result: =?us-ascii?q?A0EWAABKBp5dfU1DioBlGgEBAQEBAQEBAQMBAQEBEQEBA?=
 =?us-ascii?q?QICAQEBAYFqAgEBAQELAYIac3ASKoQjiQKHRCWDbpAVhywBAQEBAQEBAQEGA?=
 =?us-ascii?q?QEtAgEBAYMsgROCdTcGDgIBAgkBAQEDAQEBAgEFAgEBAgIQAQELFAiFXQyEM?=
 =?us-ascii?q?CwNVGQBAQEDAQIPERUIAQE3AQUJAQEKGAICJgICAzEBBQEcBgEMCAEBAR2DA?=
 =?us-ascii?q?IILBKNvgQM8iyaBMoJ9AQEFgkmDLoE/CRIObCgBinCCdT+BOAyCXz6EWYJ5g?=
 =?us-ascii?q?liWK5ccB4IlZgSUKQYCGY17EoszLY4AmTYCBAIEBQIGDyOBRYF8fYMvUBAUg?=
 =?us-ascii?q?U8MFxWIT4VAQjGBCJNdAQE?=
X-IPAS-Result: =?us-ascii?q?A0ErAABKBp5dh0O0hNFlGgEBAQEBAQEBAQMBAQEBEQEBA?=
 =?us-ascii?q?QICAQEBAYFqAgEBAQELAYIac1ExKoQjjlyBaiUUg1qQFYcsAQEBAQEBAQEBB?=
 =?us-ascii?q?gEBLAECAQEBgyyBE4JSIzcGDgIBAgkBAQEDAQEBAgEFAgEBAgIQAQEBCgsJC?=
 =?us-ascii?q?CmFNAyEMCwNVGQBAQEDAQIPERUIAQE3AQUJAQEKGAICJgICAzEBBQEcBgEMC?=
 =?us-ascii?q?AEBAR2DAIILBKNvgQM8iyaBMoJ9AQEFgkmDLoE/CRJ6KAGKcIEdgVg/gTgMg?=
 =?us-ascii?q?l8+hFmCeYJYliuXHAeCJWYElCkGAhmNexKLMy2OAJk2AgQCBAUCBg8jgUWBf?=
 =?us-ascii?q?H2DL1AQFIFPDBcViE+FQEEygQYBAZNdAQE?=
X-IronPort-AV: E=Sophos; i="5.67,277,1566885600"; d="scan'208"; a="414234631"
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="scan'208"; a="369194446"
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="scan'208"; a="369140578"
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="scan'208"; a="369086125"
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: migi9492@g.colorado.edu
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1e100.net;
 s=20161025; 
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date        
 :user-agent:mime-version:in-reply-to:content-language        
 :content-transfer-encoding;       
 bh=bDqDxoFy92WA4ghkXv1lx9zPC55ecQKMRynuRGpc+u0=;       
 b=k7w1NOh+Pe8QGO1V8BPo7AJkCT1/0SH9yx4UIw2QHyOAXutJBoMEHKnQNhs9p1zKdo        
 frlSJ9TRbqNbF2tJfA1n8fjUrPOYCBcloA4Oz34Z0IdM0b+LAeY0Y5dWzTr88HLrwQrz        
 /3CwlSgzFepJExeKhygzJ9vs6JeoJAd9HOUrVrGtqUeqE+S0KUgEqPErRSuOPUD53uRf        
 Z/VIi3UPdT1QJcqyTHGfY7HhGoonNCmHkotXtV+ZFxaR8QuC4GxlGNJ4FxfdTK2sbU2o        
 S7u1hSVx4QEx4JxzcqBA112qtZLSvQ+GUJBDMBKzSyU8Zf+eOszL9aCKzSImDTJi9PiF        
 IONg==
X-Gm-Message-State: APjAAAWsMZPTbmtMONVvzPMxpQubxptFb51b7JF3jo26S3Z79wO1lbkn 
 OczAoMuU9yl2vAWgpAjc6RwCtA==
X-Google-Smtp-Source: APXvYqzS4G4hCzugWk9CK8hEXOZqPw/jgCNwNE5AD8pAOVurhhqma+ZSJFGExlpy2Hxm0bdJ4iPIUw==
X-Received: by 2002:adf:8123:: with SMTP id 32mr3763237wrm.300.1570636862592;
 Wed, 09 Oct 2019 09:01:02 -0700 (PDT)
To: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Mark Brown" <broonie@kernel.org>
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
 <20190813083550.5877-4-srinivas.kandagatla@linaro.org>
 <ba88e0f9-ae7d-c26e-d2dc-83bf910c2c01@linux.intel.com>
 <c2eecd44-f06a-7287-2862-0382bf697f8d@linaro.org>
 <d2b7773b-d52a-7769-aa5b-ef8c8845d447@linux.intel.com>
 <d7c1fdb2-602f-ecb1-9b32-91b893e7f408@linaro.org>
 <f0228cb4-0a6f-17f3-fe03-9be7f5f2e59d@linux.intel.com>
 <20190813191827.GI5093@sirena.co.uk>
 <cc360858-571a-6a46-1789-1020bcbe4bca@linux.intel.com>
 <20190813195804.GL5093@sirena.co.uk>
 <20190814041142.GU12733@vkoul-mobl.Dlink>
 <99d35a9d-cbd8-f0da-4701-92ef650afe5a@linux.intel.com>
 <5e08f822-3507-6c69-5d83-4ce2a9f5c04f@linaro.org>
 <53bb3105-8e85-a972-fce8-a7911ae4d461@linux.intel.com>
From: "Srinivas Kandagatla" <srinivas.kandagatla@linaro.org>
Message-ID: <95870089-25da-11ea-19fd-0504daa98994@linaro.org>
Date: Wed, 9 Oct 2019 17:01:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
 rv:60.0) Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <53bb3105-8e85-a972-fce8-a7911ae4d461@linux.intel.com>
Content-Language: en-US
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
X-MS-Exchange-Organization-ExpirationStartTime: 09 Oct 2019 17:44:50.9602 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: a0c352a7-ca0f-4596-d96d-08d74ce062c3
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-Forefront-Antispam-Report: CIP:128.138.128.232; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:SKN; SFS:; DIR:INB; SFP:; SCL:-1; SRVR:CO2PR03MB2326; H:ipmx2.colorado.edu;
 FPR:; SPF:None; LANG:en; ; SKIP:1; 
X-MS-Exchange-Organization-AuthSource: SN1NAM01FT049.eop-nam01.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: colorado.edu
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0c352a7-ca0f-4596-d96d-08d74ce062c3
X-MS-TrafficTypeDiagnostic: CO2PR03MB2326:|CO2PR03MB2326:
X-MS-Exchange-Organization-SCL: -1
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 17:44:50.7830 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c352a7-ca0f-4596-d96d-08d74ce062c3
X-MS-Exchange-CrossTenant-Id: 3ded8b1b-070d-4629-82e4-c0b019f46057
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3ded8b1b-070d-4629-82e4-c0b019f46057; Ip=[128.138.128.232];
 Helo=[ipmx2.colorado.edu]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2326
X-MS-Exchange-Transport-EndToEndLatency: 00:56:27.1476108
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2347.014
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; ex:0; auth:0; dest:I;
 ENG:(750127)(520002050)(944506383)(944626516); 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yaUnhvHYLzcaUk1gRPY6y3eQQvDLqJPR6yedxXmO0d9/cfsdHFeM4gueSEhS?=
 =?us-ascii?Q?wyDhppRWpktlnaoEmQtBF36s21ZsuXdytuScqhEIo/otiRAFhTHkMGTAV/5b?=
 =?us-ascii?Q?6kTaSupYuPYIpbSifK2NGI5AL287bMzOzdxWyU1D2u9x+XTDOOaPHS0c3j76?=
 =?us-ascii?Q?uSjKuDfWQ4OIPycRezurVGoTd9ZeMWGfG58ffI2D+3wAFPn6/Y4HQ0DqiQ+L?=
 =?us-ascii?Q?QLZXClWFMDpWO/vKqFjFg8gKf7o8bazliJJvsgX4+lf4teEh7f4kxaf32SFr?=
 =?us-ascii?Q?sK8MPb+rgTtfPRmhdKLytztfEF7I9fqzAlFDP4M/UJgRbF10EwWOpFuh7onX?=
 =?us-ascii?Q?LtAoylU8xXvjIqoyDgqNWiNdld7EgDsY9/WWMXKU5vg0sAiteP8w88oryiMe?=
 =?us-ascii?Q?+LZ43mTFuNgUmICAhjPxIW//D4z6GkaMyI0Gw9zBKoeVBxhpOYM7Ri2bhMBd?=
 =?us-ascii?Q?vNc+rIveJCn31iD4fDkcYCZVVysGmr0RO7umbRQQ9ZTDLcMVcEmqJPfQ120h?=
 =?us-ascii?Q?E1hD0yrJl2vOvkrj/vHTHBQlsauw5noeR96T5ECq8mgiEcX+rjGLYmozvpO6?=
 =?us-ascii?Q?huH9MjhiwCwlpD4ihE4T7vm4W9XDhKSgbVXjOaXPZYQqaQv15uUJ/hPXYvY8?=
 =?us-ascii?Q?oeI8LvdW4XFIb+CHFYbxP8HujoCtdt3CkBD2BmI0IYu8lu75rA8fB2lL6uYy?=
 =?us-ascii?Q?K2MfJ15vSlhuwzrgbynAdYeBL9+e4aJxepjiasOtpimfuuFyJiUua1xao6H5?=
 =?us-ascii?Q?1Qxzohr002MUbserMTk4zAMhL8fI0x3jqSjO0havqS9jh0g0ZZIoVYiqnGkn?=
 =?us-ascii?Q?1rC7Cz+bKKVu4p/xsNZl4ty/ys2C715Eaebo0X/ynP9gFRadS2X6mPpVr/8I?=
 =?us-ascii?Q?YKv5RDFBv0CY02ufY4oJ5MXmJK1vKcy5fzAn3bN63Cy0X+80Sr0pS3px3bKq?=
 =?us-ascii?Q?ExgqiUxPUQ4cxkQZkHSdfQaPWI351myXXwz6WSJ40SUoZsAfJJtQiFg1aJjz?=
 =?us-ascii?Q?dsCpP50tbCvczVFbWunkfWrJc0X5oG4KuCEkj1BX2IqEIiie8rZ8a3X4oynI?=
 =?us-ascii?Q?MLnomZK9c0I3IGN4K07rx5NlwF/mkAGC+VMBCvJsyTb9GE379EHbuKqCj46+?=
 =?us-ascii?Q?XktuhHfF3+BlaiJoqNg/06v8Mv0+GCqonabJlbwWb4ON/umsj6UhLLeb6rZv?=
 =?us-ascii?Q?jV432thU/A83/OAh?=
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "bgoswami@codeaurora.org" <bgoswami@codeaurora.org>,
 "plai@codeaurora.org" <plai@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "spapothi@codeaurora.org" <spapothi@codeaurora.org>
Subject: Re: [alsa-devel] [PATCH v2 3/5] ASoC: core: add support to
 snd_soc_dai_get_sdw_stream()
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



On 09/10/2019 15:29, Pierre-Louis Bossart wrote:
> 
> 
> On 10/9/19 3:32 AM, Srinivas Kandagatla wrote:
>> Hi Pierre,
>>
>> On 14/08/2019 15:09, Pierre-Louis Bossart wrote:
>>>
>>>
>>> On 8/13/19 11:11 PM, Vinod Koul wrote:
>>>> On 13-08-19, 20:58, Mark Brown wrote:
>>>>> On Tue, Aug 13, 2019 at 02:38:53PM -0500, Pierre-Louis Bossart wrote:
>>>>>
>>>>>> Indeed. I don't have a full understanding of that part to be 
>>>>>> honest, nor why
>>>>>> we need something SoundWire-specific. We already abused the 
>>>>>> set_tdm_slot API
>>>>>> to store an HDaudio stream, now we have a rather confusing stream
>>>>>> information for SoundWire and I have about 3 other 'stream' 
>>>>>> contexts in
>>>>>> SOF... I am still doing basic cleanups but this has been on my 
>>>>>> radar for a
>>>>>> while.
>>>>>
>>>>> There is something to be said for not abusing the TDM slot API if 
>>>>> it can
>>>>> make things clearer by using bus-idiomatic mechanisms, but it does 
>>>>> mean
>>>>> everything needs to know about each individual bus :/ .
>>>>
>>>> Here ASoC doesn't need to know about sdw bus. As Srini explained, this
>>>> helps in the case for him to get the stream context and set the stream
>>>> context from the machine driver.
>>>>
>>>> Nothing else is expected to be done from this API. We already do a set
>>>> using snd_soc_dai_set_sdw_stream(). Here we add the 
>>>> snd_soc_dai_get_sdw_stream() to query
>>>
>>> I didn't see a call to snd_soc_dai_set_sdw_stream() in Srini's code?
>>
>>
>> There is a snd_soc_dai_get_sdw_stream() to get stream context and we 
>> add slave streams(amplifier in this case) to that context using 
>> sdw_stream_add_slave() in machine driver[1].
>>
>> Without this helper there is no way to link slave streams to stream 
>> context in non dai based setup like smart speaker amplifiers.
>>
>> Currently this driver is blocked on this patch, If you think there are 
>> other ways to do this, am happy to try them out.
> 
> So to be clear, you are *not* using snd_soc_dai_set_sdw_stream?
Yes, am not using snd_soc_dai_set_sdw_stream().

--srini
> 
> 
> 
> 
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
