Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 047C2352087
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 22:20:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BAA316AE;
	Thu,  1 Apr 2021 22:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BAA316AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617308437;
	bh=i/D3s8PHVpCzNtjZewZReZtap7e5H7hWNRbafYrfLuE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X/nHXjCRn2Bu4gc4LPWl0/jcuMLGA2cW4JcsJhu8WHrVUYZrfQ12xlcm2tYZtTbtM
	 9nQJoFpHnLttzh0AmIbBKX1Kx5/sUY1WbTfXNYekDmVGks1aBW8oiaMUvmh/VOOOS2
	 lUknPk/7gjxHVTEOXCfL+LHrxWBxW0ki9Kz+WrSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E18FAF80117;
	Thu,  1 Apr 2021 22:19:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 507C6F8026B; Thu,  1 Apr 2021 22:19:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn2096.outbound.protection.outlook.com [40.92.23.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B9F6F80117
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 22:19:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B9F6F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="tLbmz5i6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTPP9euZNimLCFJqVBtgUC7avsENJd0mf1jSHKNPjOq6xO1wQa0fhRqFHQV3ypQQUbsd0zt2ZqLNOi4cRjNqFGWVc7DmUODz+iyTAt7TnF3iB7VgRynl97SkaGBsT1uTR3oDfZ4TV0ujsXkcpVqlVLi00+FRUiYDbX2p3UefD44Kh3bzPDn8wavLYSENxP9ykc70hwfSkCZK5n5o08tm/3UdXC4bc3OeY8rI6rLWRuwTdEh5Q7YfWKceviFbgX/3Q2S9jO4E7tdjsZ1+8VjQKkWUDg7zP1gzXBF045jPF+ZfoHdNVPXjWE0P/apt9O8TnB3FQb5Zp9SsgUSNc+AjEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzgp+9mlrOZj+FVvtFrQcIz3Xv1ThPOsuGBfZRWJYm4=;
 b=i71vvMQ8IFRkWH7IYpFYB/W+tBq535WK2Y0pi8jHzW47TFhQRcS9y9i8Xw7CcYZuKjweUA0kfID8S5ioSam+NnYiLfj3q5uJS994vXvm3g5jR8yJHx8ja3n67N0HBP34qxLYk6w1+5jYHY/anffKFyofyQSdqL7I+8S3Ux2YYIGXXE/PxtztFA7noLj33LtC5+SKyYIqN5kTVRm6S8fZMAf8L/C12ud8W/CATEDjrlRTv31l5b2uxkju7RPL+/7e34MKVMth0eNrVRaCZiPtL595YzDNong8pPQqVz4OQs3jQyf2zSarzigS0uUNP0F6Y+1lmfbM6ZVg860CZhXqtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzgp+9mlrOZj+FVvtFrQcIz3Xv1ThPOsuGBfZRWJYm4=;
 b=tLbmz5i6QCqhyEibJsrhG1ooFXrHbURJwpiOdOuA7V4UjBJd/b7HO0knniiA4MPA42Fha1BkWA4LkME9Mgmj4g+58ragF3G+trDG4pXOqV3YDu3Qc8Oxt6Uygd35hfaCBLrL9ETZ8cHrQWhlNlCFt/uk+aYYjEifZeaf8U+MpVSHR+xE/yMXPZ8fgO72GhZ7TEfVC/qSiC37m4/GTTZXd694vUAYridojYawSAq7DCM1GRgdcB9H0npHMZ18mVl544Z9N1hC4xTTwKnXa2DOwu8Vv7/EHpWcCap8zcGLUdfks9HVpV969iNZtpEK2rDRT3XsG21NDGep77AH+yYm4g==
Received: from MW2NAM12FT004.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc65::43) by
 MW2NAM12HT142.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc65::430)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.14; Thu, 1 Apr
 2021 20:18:53 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:fc65::44) by MW2NAM12FT004.mail.protection.outlook.com
 (2a01:111:e400:fc65::71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.8 via Frontend
 Transport; Thu, 1 Apr 2021 20:18:53 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:3AEAAE98E2316BFCA0F8440FC73D58A61D9257576DCA80DD6E1A1FE82DE57711;
 UpperCasedChecksum:82FFD17E39FF63340032EBF58783F0C0247AF1BD88EC96D5B9B1DCE2B8005212;
 SizeAsReceived:7582; Count:46
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.3999.028; Thu, 1 Apr 2021
 20:18:53 +0000
Date: Thu, 1 Apr 2021 15:18:51 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 2/4] ASoC: Add Rockchip rk817 audio CODEC support
Message-ID: <SN6PR06MB53426C77C1EB640CDCE478CEA57B9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20210319191337.9414-1-macromorgan@hotmail.com>
 <SN6PR06MB534258C507ADE505523E146BA5689@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20210401183258.GP4758@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401183258.GP4758@sirena.org.uk>
X-TMN: [TBERYtqmzuZFEwFHHhUs2r2dIOOWk4If]
X-ClientProxiedBy: SN1PR12CA0075.namprd12.prod.outlook.com
 (2603:10b6:802:20::46) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210401201851.GA414@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN1PR12CA0075.namprd12.prod.outlook.com (2603:10b6:802:20::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.27 via Frontend Transport; Thu, 1 Apr 2021 20:18:52 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 62644b51-e3f2-4791-4e11-08d8f54b5e6a
X-MS-TrafficTypeDiagnostic: MW2NAM12HT142:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j22WvRDlutfgxLbnyaTnJKEMLw48ri3aUDquhiaOgESGjMnK+NeJEDe/eHEl8LIeZArTLGVWd8rw1a16u1vfuDCW5xSjV8SRNvw150Qq9ByKT/rUOKQynftFzyzrZw5feVwX7IdCgqYAuw8QkE1EPLSbIhdxxZYSjARnBlkNGtm9I//fSPQ2KTRpWUOFXiA1HuvAv0cWg4K3AwPMmUHG/0JJLqvylFzxuDBw4JHwGK7ZelVCjO/B790q77/850ilStORmQU+PHxCwabhmq8800+H9QyeJykGLwaY5o1mwbEY1JRaiYQCfg1j0R0cHCnhYVxaA0Cu8BGyzsteDkt7B9j8MEq8NO98TAOAVenXpJxQBertgewU1K6+gzel/qt0
X-MS-Exchange-AntiSpam-MessageData: S5dR+Ts8xTZ7CYBrmfdUA7H/G2DFXUDwd7xjLSmrHxnkx61oJOMnuWf0O8b2tDC5e1UBc5SRnzByLSUdTjYa+ISr/l20+qsy9xui71vDSTQARQnW8eUFIpTcZiHHUvN7CtlEvnxBzcFLlD7jTmxQvw==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62644b51-e3f2-4791-4e11-08d8f54b5e6a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 20:18:53.3453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM12FT004.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2NAM12HT142
Cc: alsa-devel@alsa-project.org, heiko@sntech.de,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com
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

On Thu, Apr 01, 2021 at 07:32:58PM +0100, Mark Brown wrote:
> On Fri, Mar 19, 2021 at 02:13:35PM -0500, Chris Morgan wrote:
> > Add support for the Rockchip rk817 audio codec integrated into the
> > rk817 PMIC. This is based on the sources provided by Rockchip from
> > their BSP kernel.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>
> 
> > Changes from v4:
> > Switched to using parent regmap instead of private regmap.
> 
> This should go after the --- as per submitting-patches.rst.

Thank you... should I resubmit for this?
