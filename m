Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F005633FA33
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 21:58:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 977A616BF;
	Wed, 17 Mar 2021 21:58:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 977A616BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616014732;
	bh=HhooLQDTydW82B3Nkw6gmgwEPCNCfVjfbU9WuGTaNiU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R1c24svwmZYRVp+jLaAoYwuFz1DGKNRpyg+LT2C2NYqys0CcrjGi0F/FXOCkXy4q7
	 aKq3W/ESYn+3s384Igkbdj8mDBzMcJr+O8U8j5s4KzZcWNAlxV5NN2iYKJtXAAHJ9I
	 PHVirAvPawTNvvqgw9XzyrlnaC+uw//+14/2rAk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FC4AF8013F;
	Wed, 17 Mar 2021 21:57:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF0B2F8021C; Wed, 17 Mar 2021 21:57:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11olkn2072.outbound.protection.outlook.com [40.92.18.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05404F80124
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 21:57:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05404F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="LBTmA9Wb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+DhKAhzcVPQ+Vv5HuPzihARnSVU11GOn7+LjHa7ahlSQGyDzvR8ykPT3lOOfrHtnbSU1oyomW3CvaKSjUg0NWNSsnRDC4Mc7pgtIHL60AWXUxPhwW92CKcxVVsWc2E5KSr+7IfzIrRbl1NhZWF3czaA+LcCqgKbG7FAtrmY94eF/tFfQGa9D9BUJGR2VEtUps+MQFo0BDmxJi97xXNzk2gIVqf+82nQ17JwJTOdIzPOCYOTkGrrs+XoqXFcG7mwJKR03OlfRrsO5mzye93yG8Ctp4S1Oi7aEtBYDaNTBTidMEWwVgVn0VgHUSxqXMwyBwmSklbCQrKpMkxAbXqQGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ppdq/tyq/Dm+hYvHMj63sebWNa+BhOBFHrrLCH7Jq6s=;
 b=LlIBOV2Azt7g4D06WVep/DUY9gBHqNn6XRGL3y2kgRMM1WWFIYvhN6kOpSc1TjfYhRq8Gp2Pqbw8N9HCgDTCQpNm05kXUMwnIfnsLr+xrJEoJGf0fzYPKBwwWgxocQ472H/Ca8oTSqDYFU8qRzi+0bbKtMhtTQ2gSvP3xbO6QsWl/j2UU0rFLGKUM8bIznUoY4C0TGFkVcDrHAo86QVmrr4JnOMGsc0qUVeWFOjNFeVD/0pmGh+0Kv9nBQna8tHvn3UTMQu0tZZ6a2XQpqEqBoN+Dk/0okz5iEEsW9ISykLW7O5K2k9LpvHKrUALFr+AiciaepsZ434G3dgAZd4Scw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ppdq/tyq/Dm+hYvHMj63sebWNa+BhOBFHrrLCH7Jq6s=;
 b=LBTmA9WbkPHAYmS0AuAHJu8Sj0+HQT1c1e897DDtruwZ1+cQIq1SlAx0GOmvXyWgn2irHn62rgEcajzptp1SnA+2Jx1PJs61DxLSQnIjdzSy+8WS9VYf+lrnRuBdwViecw3oFMxSO/6qGUHf8NPy041FLGhgkaGlAH3IsJz/mFXy/QQ8WVIUbgtMGuDcdKmDzHJ/r2DQHL6PsyFN/Er2rY552WXtHEM8poR351AFO4Kp83WmoVI6Iwnz2hyu8FAnNIBM2M15aPv+YEhW2XsQpKhFuFJhruW4ThtgmVIZ4C+3D+w+LX+6nw3u082k1XQX4cPAiYefsJtHKiAdqIEvIA==
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4b::45) by
 BN8NAM11HT172.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4b::334)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 20:56:57 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:fc4b::51) by BN8NAM11FT011.mail.protection.outlook.com
 (2a01:111:e400:fc4b::140) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Wed, 17 Mar 2021 20:56:57 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:58C2973241938CAD7ADD1ECD9F1F86C2312B7C3425EF356F470E16E4217ECEC6;
 UpperCasedChecksum:061087FD49B8B0EC693BB3B22225A7AE117C1DF3E5642FC5383610F0A7FE0505;
 SizeAsReceived:7567; Count:46
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 20:56:57 +0000
Date: Wed, 17 Mar 2021 15:56:54 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 2/3] dt-bindings: Add Rockchip rk817 audio CODEC support
Message-ID: <SN6PR06MB534202C2ADB33A0CD0AF77C0A56A9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20210317202117.29926-1-macromorgan@hotmail.com>
 <SN6PR06MB53424766F673FC2427CD9AD1A56A9@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20210317204453.GF5559@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210317204453.GF5559@sirena.org.uk>
X-TMN: [fuRNrp025Nqv6yusQr0iJDfCnjjs7DAm]
X-ClientProxiedBy: SA9PR13CA0133.namprd13.prod.outlook.com
 (2603:10b6:806:27::18) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210317205654.GA1308@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SA9PR13CA0133.namprd13.prod.outlook.com (2603:10b6:806:27::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.11 via Frontend Transport; Wed, 17 Mar 2021 20:56:56 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: ca157fbe-5057-44fd-4812-08d8e98733bd
X-MS-TrafficTypeDiagnostic: BN8NAM11HT172:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MZV803nczd6EqJzCMyPZAari7a65quGwCIoJhGiQZmF2H/V86iMNfiE9dPQKt70eS/Usd6NyXVTSQVeIXxkNgjt4LVmDMOM7UxOckMzPC/JWk0wLSRqui4169374P5sMGbRDJ0J5ySR/dbwb9LR8h/jxlsNhzha3XP5bR2DdT/A8lQF84GUpC/V7tX8c07vh0BbnbiKnNKGu3otdJaOh9HXLfGxhz4i9bQJlceOfmH4rMzVUazP09/qWqcDxK1eall9j2+gT/bWcvQ/CIQCq3gGZ/6ySKFt0FYoue721SqH2pHM4P+r+/d7dw9L2lROwLANnzx9+fbfDNJnmLaMZ1rEZQiaKCgJaHah/dpG+a689/Mn3rKLdjXnX7Lev7D8WNlS5dzKEvlqbE0NSbje4/A==
X-MS-Exchange-AntiSpam-MessageData: BVom3JLkwJyzjFkjl1/V4hPuzzeMC+paa+NrXQgw4CziYInxwtgWv5U1Xy1rzBNPaJRXZYQ+pUlcVJp80tS6vFF3El2g+5AxT/lrayWrN4D/1IfSFCAB8oTzUjUbUfoILD3H+LA/TioE3Of3JaBMCQ==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca157fbe-5057-44fd-4812-08d8e98733bd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 20:56:57.4182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8NAM11HT172
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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

The compatible is still needed so that it can be registered with the mfd device itself in the cell.

Thank you.

On Wed, Mar 17, 2021 at 08:44:53PM +0000, Mark Brown wrote:
> On Wed, Mar 17, 2021 at 03:21:16PM -0500, Chris Morgan wrote:
> 
> > +  compatible:
> > +    enum:
> > +      - rockchip,rk817-codec
> 
> Sorry, should have picked this up on the previous version - you
> shouldn't need the compatible here, an rk817 always has a CODEC.  The
> actual driver has already been updatd and doesn't use it anyway.


