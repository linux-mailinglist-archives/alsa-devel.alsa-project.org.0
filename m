Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C105418D559
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 18:07:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45B97844;
	Fri, 20 Mar 2020 18:06:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45B97844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584724069;
	bh=x+W39hN8Deiz1JC4Xe8tYUNA8xkl+TkZ4Y3YVLQs0q4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cznMSxQusR/4Y0nO6WZO7H4BgfRKxoNgBaexSii1U9mN+RgHPDO4NmExFXHlNuvov
	 7j38o2jvRrRhYktorWxHsmk6B+f85iM7U8uEoV6fIky2JByBQhdPMdmrr68kxuFVZX
	 +LEbH/WUU8OxBq9eTimSXJ+9ZJg9mleKrdHwC+PA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52E51F800C0;
	Fri, 20 Mar 2020 18:06:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B14C9F8015B; Fri, 20 Mar 2020 18:06:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2117.outbound.protection.outlook.com [40.107.20.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3737FF800C0
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 18:05:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3737FF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="i9qirCZD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2BBN/Z1fAaQb4J5fuBeN69Qp0fvJ5AZQDiGAfFXnaNzCqO87z8xSOmO9gddHBzwvAjsU8mFRgmAH3jM4cmi/2FDsjzrKHDIMP8pn6hI8w+mh7TYrqBvXy6+FSoGUVsd9JOJUfhiv0miVWpaBl/7NMXEy+Krp4Sqk0gI/LsN9YdwNqLlcZDW6CC+urIc9QX27Dqldef824HIR6CPD1ZfGeyo2KJTy5W8TnVTZD/uZuyKtlH9J+oEwTk8FMWsRgKFjFalweg7lAozBJ0r1VDjKGbtqJqOA5KI+Rc7USb0iG2lHRb7CPWFUHVBeyDM5UlG0mhqMCHiJl5PiBkSGze9fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+W39hN8Deiz1JC4Xe8tYUNA8xkl+TkZ4Y3YVLQs0q4=;
 b=flR2LivA8ZcMQ+ChGUhHLgpFftMLG6zG3kmJLv1dz1WaqgYxUgmdhR5fl47KiBOJQUT2ciT2r3OpenZf6abqciI28+fylP4pojk1SY8BmIiCgXDsWjHgg39M028x4kjwtaXsld+He12+rU1p5qdCe9L2udu66kjYE+feGokI3/zCyYIIP1CroxCAZU/13skYq0/zEPQlYSx05ZVros1Uwb5SiZZT+3iwubL2Q7EES8EF9zYHWgbuIhF4LYJ1jhQo+SeO7uB5STmkLpCM+rGSiDX1Kf0etoGjYoTOODmBScADmIHSTWyIYPSufsbNRwXlmxXtAsHpYlm/YVceVSzOeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+W39hN8Deiz1JC4Xe8tYUNA8xkl+TkZ4Y3YVLQs0q4=;
 b=i9qirCZDeLGTLCs4o7gESej/c7hJluJXuFEFqBhR6WFl6DuX4Csrqx2xLowjVolfNKH/K/A8F2GzvUqWL5en/r+Zbqkd2l/AMD1P7paM6oqU4L4SkqSoEAUDya6dp6uGKWo/DMqFp8RlrcVevaAuHjCpbdTZfB9H7Qnr4fX3Arw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com (10.170.238.24) by
 VI1PR05MB3472.eurprd05.prod.outlook.com (10.170.237.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.16; Fri, 20 Mar 2020 17:05:58 +0000
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::7cdd:4feb:a8b6:a6d2]) by VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::7cdd:4feb:a8b6:a6d2%7]) with mapi id 15.20.2835.017; Fri, 20 Mar 2020
 17:05:58 +0000
X-Gm-Message-State: ANhLgQ35CD9xhkw24uYsUGr9EV/7c5BJlGUq4ot8bnxz9G9L9btROQ75
 kAEeINwcwQg5V3F6HfhPncwXHPnRCDDEv7Ij+KI=
X-Google-Smtp-Source: ADFU+vu5eQ0XQ2gaTaJU+0kPrD4Z2okP/4JxmWwAsKxZeiK7wqSpvMQ/y+cvk0uPde5rBNpjU4WSYadgttbhdf9vC6M=
X-Received: by 2002:ac8:1633:: with SMTP id p48mr9494130qtj.305.1584723952240; 
 Fri, 20 Mar 2020 10:05:52 -0700 (PDT)
References: <20191212071847.45561-1-alison.wang@nxp.com>
 <CAGgjyvHHzPWjRTqxYmGCmk3qa6=kOezHywVDFomgD6UNj-zwpQ@mail.gmail.com>
 <VI1PR04MB40627CDD5F0C17D8DCDCFFE2F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <VI1PR04MB4062C67906888DA8142C17E1F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <CAGgjyvGAjx1SV=K66AM24DxMTA_sAF2uhhDw5gXCFTGNZi8E7Q@mail.gmail.com>
 <VI1PR04MB40620DD55D5ED0FDC3E94C2BF4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <20191212122318.GB4310@sirena.org.uk>
 <CAJ+vNU0xZOb0R2VNkq6k3efdkgQUtO_-cEdNgZ643nt_G=vevQ@mail.gmail.com>
 <af99c9abd9c2aec6a074fb05310c56b780725ebd.camel@toradex.com>
 <CAJ+vNU16ax9JTx2kSMUF8SiVD-+4KGoFO-U07xM5eE=T6Fwjhw@mail.gmail.com>
In-Reply-To: <CAJ+vNU16ax9JTx2kSMUF8SiVD-+4KGoFO-U07xM5eE=T6Fwjhw@mail.gmail.com>
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Date: Fri, 20 Mar 2020 19:05:40 +0200
X-Gmail-Original-Message-ID: <CAGgjyvFNCbFw7x6QL063oi-fV2UuVQVfL1cv_pQ74HWoJS4Etg@mail.gmail.com>
Message-ID: <CAGgjyvFNCbFw7x6QL063oi-fV2UuVQVfL1cv_pQ74HWoJS4Etg@mail.gmail.com>
Subject: Re: [alsa-devel] [EXT] Re: [PATCH] ASoC: sgtl5000: Revert "ASoC:
 sgtl5000: Fix of unmute outputs on probe"
To: Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: MN2PR06CA0007.namprd06.prod.outlook.com
 (2603:10b6:208:23d::12) To VI1PR05MB3279.eurprd05.prod.outlook.com
 (2603:10a6:802:1c::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mail-qt1-f177.google.com (209.85.160.177) by
 MN2PR06CA0007.namprd06.prod.outlook.com (2603:10b6:208:23d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend
 Transport; Fri, 20 Mar 2020 17:05:56 +0000
Received: by mail-qt1-f177.google.com with SMTP id f20so5525043qtq.6 for
 <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 10:05:55 -0700 (PDT)
X-Gm-Message-State: ANhLgQ35CD9xhkw24uYsUGr9EV/7c5BJlGUq4ot8bnxz9G9L9btROQ75
 kAEeINwcwQg5V3F6HfhPncwXHPnRCDDEv7Ij+KI=
X-Google-Smtp-Source: ADFU+vu5eQ0XQ2gaTaJU+0kPrD4Z2okP/4JxmWwAsKxZeiK7wqSpvMQ/y+cvk0uPde5rBNpjU4WSYadgttbhdf9vC6M=
X-Received: by 2002:ac8:1633:: with SMTP id p48mr9494130qtj.305.1584723952240; 
 Fri, 20 Mar 2020 10:05:52 -0700 (PDT)
X-Gmail-Original-Message-ID: <CAGgjyvFNCbFw7x6QL063oi-fV2UuVQVfL1cv_pQ74HWoJS4Etg@mail.gmail.com>
X-Originating-IP: [209.85.160.177]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e807674-1a79-4b46-75fd-08d7ccf0f464
X-MS-TrafficTypeDiagnostic: VI1PR05MB3472:
X-Microsoft-Antispam-PRVS: <VI1PR05MB347277FB64FC1338FEF66B0AF9F50@VI1PR05MB3472.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 03484C0ABF
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(39850400004)(136003)(346002)(376002)(199004)(44832011)(52116002)(86362001)(6666004)(81156014)(8676002)(81166006)(478600001)(6862004)(316002)(8936002)(5660300002)(42186006)(55446002)(66476007)(9686003)(26005)(2906002)(4326008)(66556008)(54906003)(53546011)(66946007)(55236004)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR05MB3472;
 H:VI1PR05MB3279.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2fXdHew50dSpt0Rl6p845yDGDwL/8MbbNGi0k3yy8jZFyTY/g3Q0qSbgfegLBPtAWmAL9q+IZGPg8oVHw2kBNjAlbCGOh/RIRurfhopCqBf56cL00q3fFx4YL5oW4YKeAhCtrasTcOcVpmWT7+VfyJT/bLHh5/VR2L+wqkbaPTkDq5b8Noive3FQKDIqp5ko0b08sWGNoRDQgOMWUJpBgITps22F1QexcV6JuzTAqyOtI6cQR83alzN32D7UlSp7+s4xH0d3zw6SY/cEpM30tBiw07lHCkqfs+jHjYc2OplynqQuFb7W+IOXxpILLf7sisfXApTLp3fiCemiI9Kdt9PX2il5buQOnD8Rdt5oq6V5XnZt8gcrIPLw5hOKlgQUO5dk0axmUs65BLMNU/A0dt1rDIEqQET1Xs61I5Gz/09proXD28Um2EiNDRFgTKtK
X-MS-Exchange-AntiSpam-MessageData: PN/fVVEcZaIrN9ZDGzM2N27el3swHzREk/z5Cv1sQ8P8pR8tjTKuBManTzpXrfu+7Ix/jgwf/e/YKs9vt5ZKcTkDSydgT8LBc1QMIZn19YSDgz2krEuO7E6h8qMXCwkkCvbuJvU1raVtVCex0iMZpA==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e807674-1a79-4b46-75fd-08d7ccf0f464
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2020 17:05:56.3784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FgzoDdJrxzExla1vksSv/oWGZ015e2F4oGWeK/L3llpW+wcR94D9c8cJgsZ1tpAE8+xyiJog2jRO+/w6qN5p6O4rOup24dD22VV5CxtrKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3472
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "alison.wang@nxp.com" <alison.wang@nxp.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Igor Opanyuk <igor.opanyuk@toradex.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>
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

On Fri, Mar 20, 2020 at 5:51 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
> On Fri, Mar 20, 2020 at 12:26 AM Marcel Ziswiler
> <marcel.ziswiler@toradex.com> wrote:
> >
> > Hi Tim
> >
> > On Thu, 2020-03-19 at 13:49 -0700, Tim Harvey wrote:
> > > On Thu, Dec 12, 2019 at 4:24 AM Mark Brown <broonie@kernel.org>
> > > wrote:
> > > > On Thu, Dec 12, 2019 at 10:46:31AM +0000, Alison Wang wrote:
> > > >
> > > > > We tested this standard solution using gstreamer and standard
> > > > > ALSA
> > > > > tools like aplay, arecord and all these tools unmute needed
> > > > > blocks
> > > > > successfully.
> > > > > [Alison Wang] I am using aplay. Do you mean I need to add some
> > > > > parameters for aplay or others to unmute the outputs?
> > > >
> > > > Use amixer.
> > >
> > > Marc / Oleksandr,
> > >
> > > I can't seem to find the original patch in my mailbox for 631bc8f:
> > > ('ASoC: sgtl5000: Fix of unmute outputs on probe')
> >
> > I forwarded you that one again. OK?
> >
> > > however I find it
> > > breaks sgtl5000 audio output on the Gateworks boards which is still
> > > broken on 5.6-rc6.
> >
> > What exactly do you mean by "breaks"? Isn't it that you just need to
> > unmute stuff e.g. using amixer or using a proper updated asound.state
> > file with default states for your controls?
>
> the audio device is in /proc/asound/cards but when I send audio to it
> I 'hear' nothing out the normal line-out output.
>
> >
> > > Was there some follow-up patches that haven't made
> > > it into mainline yet regarding this?
> >
> > I don't think so. It all works perfectly, not?
> >
> > > The response above indicates maybe there was an additional ALSA
> > > control perhaps added as a resolution but I don't see any differences
> > > there.
> >
> > Not that I am aware of, no.
> >
>
> The output of 'amixer' shows nothing different than before this patch
> where audio out worked (same controls, same settings on them). I'm
> testing this with a buildroot rootfs with no asound.conf (or at least
> none that I know of... i'm honestly not clear where all they can be).

Tim, did you try to unmute the output with amixer?

Could you provide the output of your amixer with and without this patch?

Before this patch, the driver unmuted HP, LO, and ADC unconditionally
on load (while it just had to set up ZCD bits).
Now HP, LO, ADC remain muted until one unmutes them using standard
ALSA tools/interfaces.
ALSA mute/unmute controls for these outputs have been presenting in
the kernel for a long time. Please, just use them.

>
> Tim
--
Best regards
Oleksandr Suvorov

Toradex AG
Ebenaustrasse 10 | 6048 Horw | Switzerland | T: +41 41 500 48 00
