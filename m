Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EAE33FA65
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 22:19:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9197E16BC;
	Wed, 17 Mar 2021 22:19:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9197E16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616015997;
	bh=y+D/GER5RUowh3iO6l1VpxK/Gt621/6GC1f7NZzceDU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MwOmWCP8Bfwnl3/MhvPW/oUT1CpmJ/oo5yx4tbN5UnMgyYQegi+5pUrOA6mf8Lzj+
	 okpT2LXwt4gi2NJ3In8XHGxBTLAxZxSQLxP7JNDFVWv9UmoyrvK8ZsmB0HJr7KCXWc
	 +rvZxRZPOptIEoHiMjq3TAp9eW7Q5bQPGXbQmsdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 005C6F801F7;
	Wed, 17 Mar 2021 22:18:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27817F8021C; Wed, 17 Mar 2021 22:18:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn2018.outbound.protection.outlook.com [40.92.21.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EC82F80148
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 22:18:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EC82F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="Cn+O6qqQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ok/AHCOgUqQ/EGHnQIEDn5kyKmuHkW9zTgtkVU7K8hEcg3dsF/rKwMFfzkGRp0XRx/neN089Ods4FXEiTr9Y1XdYmxGbmWoM/65cocStw1IVZwoQk+eF/6FZkJ/p6MFFGhJW7ebNmgJBfk47L6SwBQ5Jttei/RUjCA0Bnv3mCY0xyCkWcyrWPmmXEk2ZATWK9bUjTzAskio5rxWiDGItkVBUDanbyRzTmpJIWH3d7x6UrQsQAajmaH1OcY+Cai3XnZC8y53Ij2lQjE0TaKBFbMFLCuwfAya5rc4lm5aZfU4mzOHUg+RvGcdB/9TKtLXRfLfgReUg/X5c5tD7BQ28TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncnKOrGfnLo/F22mNtUK1n0Z0gZXRHDTVNZkDkl3UhA=;
 b=PdZo8eZ/+9z/1vvDcNc6W3G+sazjGLpl/GYYKjTX5AdpL6r61h6oDsViAJjCb2pKB2ezRWZK4aKhaLPBnAxb3Vko3huPk8HK8ntHGIwW0/y+b3dNv3s/g3vOGzwosvd9b5yt9pLRT324WOiWieT52ArlZ4BlZxVzM2LXFDPInsm9bEZwTB5vfqKna44tueDLBFpr3oBBsfOHmdJAN4ll7zVxLUeL/PV61SM7xrfyhCgonuzbwsyP0haufisgnFpu+plFrTNIjDg2BzvjiGhFRixKnHRDm3jyKzfpZZYD85ZPJbGQ0QAi5whOkiLIRgqB2wYVoVsBujP2C9NZepn+YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncnKOrGfnLo/F22mNtUK1n0Z0gZXRHDTVNZkDkl3UhA=;
 b=Cn+O6qqQf0GkDmXLLwqAaS08ly1Bd0QuNmOUbX18FTBgXRdSBzEHRdelHBw9XH3iW38D7EVIrevXJkPBR9OTSp4JwuWlSpEf+wBb0qpGQg/mu0NIdiwIq3AhYAI7wv5LVQJYyqo5PhBkaQyR/+zZpYhGOOnpw4/FqJxUapv4zZMpzP0ap9PqyuQNpqSkAY1nqUDnlFgLYXPhOwbwehy2Kq8IYawwhZARRWkTaDRr1zN/H2S3r6zruQi/+WC8Z6RGssSXsoR6Kk6FZw+77WL7v0zVG28c/G1STrinrbOT3fQxLdE8QBmfukNY8uXZxlJOznGYNebITFL08aJDYf1x+w==
Received: from BN8NAM12FT047.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc66::50) by
 BN8NAM12HT059.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc66::271)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.9; Wed, 17 Mar
 2021 21:18:19 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:fc66::50) by BN8NAM12FT047.mail.protection.outlook.com
 (2a01:111:e400:fc66::318) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.9 via Frontend
 Transport; Wed, 17 Mar 2021 21:18:19 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:B8BEDF1CA9E01993DD0C5C201D607C83CE0F14C4ABEFBBA71A53B3305010B40D;
 UpperCasedChecksum:55A13568EDD38E5715A4AB9447D84BEB9E65E31CDDD4C2033DBF7FAA8D9CAE2F;
 SizeAsReceived:7705; Count:46
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 21:18:19 +0000
Date: Wed, 17 Mar 2021 16:18:16 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 2/3] dt-bindings: Add Rockchip rk817 audio CODEC support
Message-ID: <SN6PR06MB5342A36ADB963DCB4402F5E6A56A9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20210317202117.29926-1-macromorgan@hotmail.com>
 <SN6PR06MB53424766F673FC2427CD9AD1A56A9@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20210317204453.GF5559@sirena.org.uk>
 <SN6PR06MB534202C2ADB33A0CD0AF77C0A56A9@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20210317210530.GH5559@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210317210530.GH5559@sirena.org.uk>
X-TMN: [uQgEMyp2M4L9+9OfaTRORijo+ZwsVt5w]
X-ClientProxiedBy: SN6PR16CA0058.namprd16.prod.outlook.com
 (2603:10b6:805:ca::35) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210317211816.GA5038@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN6PR16CA0058.namprd16.prod.outlook.com (2603:10b6:805:ca::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 21:18:19 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: e35580e7-1776-4d14-0625-08d8e98a2ff6
X-MS-TrafficTypeDiagnostic: BN8NAM12HT059:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qj5JA18M9XVyS4JqiYAZYWlaT60chhG705hPWIV65IPV/CPSFhQ1VmDBP0qROZhWPEy7KVFcwrnZFvFfhJblzHPhTkanKogOHhW5BQCXDvjkAokMIWvQdyxNQT/5bAGyZJXDKWU6tSEV7iHTmoSgStBRpOigmtmAsM1oz+4wTZD0YrfJFns8Mf6KvmbJdJeWIgjJm1ipvi188hQaTX++cCCy2sT3XLpCIv5euJEP+wce4HWT9NMuLwrzT/2h1hB89d0qN5Ea6t0U+RvbmH/viBVk5+xDu8l9OXK6VUyCk+8vobq45AaLW2atOyuIt4uAaObYxXAFVAUi39vRxJywvZwPZJWJ1vo/dRiKrbHs4fLeTJEfhWmgKgOUpJjilKNSxQ9FSuCKZXW28Yq7jERuEA==
X-MS-Exchange-AntiSpam-MessageData: a7TOBp/lFhiP4FIoKLmEHCDuLmv8OqGIR0t6Sgwf2hn6mDaCPHqb9VWsiB9mDuHfJX1VM/LMzcHVLmnjMN/QTdBc0ZBcRpQmw2SbvQ9XhFk7x6yKFOLkNe7pP32fCGgOfZ2yBbiOefvTisSZVn6Bbw==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e35580e7-1776-4d14-0625-08d8e98a2ff6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 21:18:19.6154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT047.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8NAM12HT059
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

Sorry, still getting the hang of mutt. I've got my wrap set at 80 now, and I'll try to make sure I'm replying correctly. Hopefully this one comes through correct.

As-is, when I start the driver after removing the device-tree compatible field or the of_compatible from the MFD driver, it doesn't find the mclk (and thus doesn't start). But that's my problem, and I'll try to get to the bottom of it.

Thank you.

On Wed, Mar 17, 2021 at 09:05:30PM +0000, Mark Brown wrote:
> On Wed, Mar 17, 2021 at 03:56:54PM -0500, Chris Morgan wrote:
> 
> > The compatible is still needed so that it can be registered with the mfd device itself in the cell.
> 
> I can't parse this?  What does "registered with the mfd device itself in
> the cell" mean?  If you register a MFD cell then the function device
> will instantaite based on platform bus matching.
> 
> Please don't top post, reply in line with needed context.  This allows
> readers to readily follow the flow of conversation and understand what
> you are talking about and also helps ensure that everything in the
> discussion is being addressed.
> 
> Please fix your mail client to word wrap within paragraphs at something
> substantially less than 80 columns.  Doing this makes your messages much
> easier to read and reply to.


