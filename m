Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1AA4AD318
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 09:22:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21BD116D7;
	Tue,  8 Feb 2022 09:21:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21BD116D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644308547;
	bh=JIu9otwfatIHeLN+2xiUzUPwNCxYEjLNHaN9y/J+Jy8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sLQlhMhCe5FNw5BlsQI0x+I+5RHOhik/GADI02DJuILK/BqnbWUiGSA/o/NM/B4kx
	 ykVKvrltGlKu/PrFumZ242TJrsgr1+iwHrwqgU0Mif0QKbXsUgMlIKMqTFRzDSgZ5Y
	 XDvjh+ZASbkp9E8dG75nvl7F7bS2h34k/zRh+Hmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6707CF80154;
	Tue,  8 Feb 2022 09:21:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57C2DF8013C; Tue,  8 Feb 2022 09:21:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:4012::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AF65F800E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 09:21:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AF65F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="ZCZ7S43a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+F6l+jVb7Kco+dIoG7UD+FYcjbT9rVqzsxIf5oqY3fP0MCObycs7et0cHguXz5E69Qx6o6GBDWl31USs+g6rbjq5K0d6Rs0l0xOFsixRBd/zOxXWDF/7JkyCRmZc7YL7R0n/H1so81xEvzB5j5qAhcMpAdvLshmH0D53WEJprHla/KWBiY6A/MsdfmDl671u/BZ8dNwt4JziBMsgwzX9lo2zPvAQhX0ThWC0CYK/5T4sYVSM5SS7ME/dDbWCvKHLJr6ObFcXGU36VM/m9yJbQQuFO3whXYKPn1usM/RfjyvVrlX+MBK7eZXZ7nRHo56/BNsMdgWIWwKT1KX24BrbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbGO8sKzqzmh4Myt6+k/y+gtASMCsj0mDiLkyqOztyc=;
 b=EbAY8hqE9R/h2ubpzQ69+esTGGp5czSByDqFQXwqJhB7UpZJgKEzEyT0VHreRwZyylu9rYyOpwoVlraqh2kwGcP7NZzqRppQ7z0LSwG8is4PO6cuvmYpOSW+aLx1p9XN/THNvFhDbn/VkJg7hfTpVsHEPppRzSUc0iNbLZ6Web0T5G3TXfaUXsBCmQzGkWv0HA1BmGfrvhfCZWddX6tS7mSmwi2QHe9hw2f9XK+1n1hNxWVRuhXHOMZTF6urxdO5uLaESEHduud3uV9cZI68wXva/fyepj2od0FY18Bx/ttMFOwxUFRPxQdI6OQ5kFfZjSBf4MweUlO2sdK4bfh9+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbGO8sKzqzmh4Myt6+k/y+gtASMCsj0mDiLkyqOztyc=;
 b=ZCZ7S43aa9Pn2a06gdiafkdwohRFrNYpHJrz5O2DID8vZE/DJbdmy0F3lUdfgI0Y2epW2Em9JPlQyege0C6rTNNG9ngnxwWMEyh73qT4udDCGO8UneQ58JxD6mewayVTSqWTuIu676QfwjpsxMQB4HN3MxCFzpwffLmUZg1EZkk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toradex.com;
Received: from ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:3d::11)
 by GV0P278MB0965.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:54::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 08:21:10 +0000
Received: from ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6c4e:9890:b0f5:6abb]) by ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6c4e:9890:b0f5:6abb%4]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 08:21:10 +0000
Date: Tue, 8 Feb 2022 09:21:09 +0100
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1] ASoC: nau8822: export right speaker inversion
Message-ID: <20220208082109.GB1217637@francesco-nb.int.toradex.com>
References: <20220207153229.1285574-1-francesco.dolcini@toradex.com>
 <YgFClQRVX5cX6L3J@sirena.org.uk>
 <20220207170351.GA1217637@francesco-nb.int.toradex.com>
 <YgFf5hvxLppKYIUJ@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgFf5hvxLppKYIUJ@sirena.org.uk>
X-ClientProxiedBy: GV0P278CA0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:26::17) To ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:3d::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61c666b2-9d5e-4ab3-d9e8-08d9eadbf67e
X-MS-TrafficTypeDiagnostic: GV0P278MB0965:EE_
X-Microsoft-Antispam-PRVS: <GV0P278MB09652DAD2B2F9AEA7556B21FE22D9@GV0P278MB0965.CHEP278.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nqv8YYHvhbrnfrEV/KTVtSLjWAMjCNO02MECCqC067EFIYcu1lwofNKwANd9mHWR801NLaWq43NK486b8PlRbUXtrS2gsJb8RunwODzmSKM2SCls4BAl8eUoDJBdMbzhDMX+EPTUdL5YavrC2TEZhrBnruPmmXTbyX5OFFZe1DnfXFNgFO37m6FoFr/hoj5MV46+JhEb4jw0mLezoAvI2yd/kSiRPk+OQaoNtcoY5Gse7QBlSNXZ36Efn4Pzxm8+VjWELCHdw4X+ts+q3FyPXPCA5aBKfVYS7+0dTApHj889BX2F/sECpWfDGFyGmHc2iqidVWXNHMAQIPmmhwbdZfAB0yNbMtS6pHC6v1yweKGI4bQAoGA3OAvpEt8bM3ZUnzrB1E6o333qElN1H1SVy7h13UV+9lUhe4ZacPGKTFzoDHSIAzzPORmNOwzkMnLkGsQW2i6U0mHuDQW5/p/W4DkYe0vVSyyrcEIO/Yeg8LtuxA+47WyJN6pxB4/B9EeSRPIVAfBWfUmJtPzIYqLcO1QB04OBQkQVaEOX5MMua2q/HXNA1dFTo1pCG8IwI+igEIphl9LLepcidGpzcnJA1YFTpza21d3RSAaaj0tkq+l30pSqclUK2LOOrSqeevEjt27KP1top/exCaWDswzQwDnBWGYt/fN9sQFvkINBHWU1xPfg5YOImGvaQ193Quene+NkZGDN+E19uxrZfg/wBUY1UmGTcNf0W/MdPEfuNTZJ7EB7g/Q3cH82pBzjtZra75eMSnh4x+rS1yg5l1QW9ciPew9pwHahxCWbpgvqUXU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(396003)(346002)(366004)(376002)(136003)(39850400004)(5660300002)(8936002)(44832011)(66476007)(66946007)(54906003)(4326008)(6506007)(8676002)(66556008)(508600001)(6512007)(966005)(83380400001)(52116002)(6486002)(26005)(2906002)(33656002)(86362001)(38100700002)(38350700002)(1076003)(316002)(186003)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bhwbIr5bgi26rc9fgM2tR7ES8QLn0NjISO5hf0ChIfrifmAgKXX4PGRkf1R/?=
 =?us-ascii?Q?oj3Xr9rPvGxScsrcjFDN0R275kh/plhAZvOgnANssLUnrWYhZo3IGSPDwA9o?=
 =?us-ascii?Q?ihrpYQUIVdkOezBYcLPvqT/oDzaIlaUnjvtqOjDW1rGLfzZrt8IL8YXXMsfc?=
 =?us-ascii?Q?ybNWPqaTWHQCKUxZbHFOt7+yoHHXkNvv8aBND6SdPmSTJ60bhPB3rVBgOHBs?=
 =?us-ascii?Q?rZnZdS6ij915qVvrYIQTMMHN+ogeHjtix+BxWKK9LQvZUI+PXKERsebU5MlN?=
 =?us-ascii?Q?y24FKs9usEgJnrecdtgO4mKSkTv168vd3bbTat7zFRODTWckPUnYzJEI3Atm?=
 =?us-ascii?Q?ziVg1ECVkd2160tElNJ49xrNg6GkeDgPRuyk5351s0VEs6poOeZnrexM5ogR?=
 =?us-ascii?Q?3h+xtfc+Q/NEV/CLL+8uk8py96Xc+EDxVUnUSBke4bG52uPGU9wkBheqDB5X?=
 =?us-ascii?Q?FP2CORWSfVgSqnGpz5FkEjtmaqGPP5ul49nf2+ZblnBFryqp2KWm5a+jcfum?=
 =?us-ascii?Q?64cmwpU0fuGqYPZxeKP0pI2cvAwuwqXUQL1a/g2yVGrWi/hfSRvXkXBdQscD?=
 =?us-ascii?Q?w7ARfSo4x7irEOdi2rnrfgzwwXE11D/RZBaUcZWJJ0ChZvb38IcI5PAb6DUA?=
 =?us-ascii?Q?jlo2RzONfdg/Xy1YXlR+LUGkEtWB+3z71UJQBxL2WaiNCFXfDgYcQmCCOgKa?=
 =?us-ascii?Q?lCi8IVe1XGWT8D82IJnb0ZwWsaIVnAEb2w6F+iYUXg0edOtiWWp2DxPTrWT5?=
 =?us-ascii?Q?zqhEUEEy4KTZIVmU+jdK+in+4CBfDyHBGdeAnok191GNuuWAH7EGVS7z/fT3?=
 =?us-ascii?Q?2V51lJyqpfxCpaNTVaSTD5nxG1FdMykkAfcnvxIE9FR9sUQbUhZVQenminZy?=
 =?us-ascii?Q?U4L5DhD8nTlMclh76k4RfSRbPsZhs3mOGzdHp+I2pUIs7I8SFyzbPef0UGg7?=
 =?us-ascii?Q?qSESrOufTOh80zU1ypnjO3u06e9+A1roloanDpVg7FZb4zskHKPN3fg8k+9Q?=
 =?us-ascii?Q?BBXeZGBxql9yl3kN+1IVS7cx/J8gKHVFr0nQPTKCkxDU/I+kOcUddXnfwIQs?=
 =?us-ascii?Q?6zwwhcWPvOb5Gk843cS6x+zlaTrwOUuq/OdRO4Bm6rmtLS7VSImFCp+pvqAJ?=
 =?us-ascii?Q?Mqj47I/MYh9vdrPablrduqR632EQJyS6uHVQ1c4BMmTbwYBGYs5KJQVvTJK1?=
 =?us-ascii?Q?hyGZgSd4/mRuZOGT/y5SYOAZMxEv65XTanbMXa+ZkENYMLrd8dnY5HlvH8Vw?=
 =?us-ascii?Q?K4GaoiXdYw3ueCIoZrtL1fjmqR67+S01ZARF2Iaj/5TRjNbMlxY+Ss1DfrWQ?=
 =?us-ascii?Q?iakDjxaWZnRJ0uoCa7Irk0QTfNWfGGUB21jLN/Y2EOrlHTzGOIo8AQ/lNJag?=
 =?us-ascii?Q?RmPWfl1ZiRx/ZiMGRQfcDOLWUzan00MkVd9mDrRgA6ISqLntzxXCkgVPgLaO?=
 =?us-ascii?Q?5kKbapaXyWYphp1KrGu0UQheFbZjeP9WwEALPbrFeSoUObIM3qzL5t+nPZXQ?=
 =?us-ascii?Q?svedEX4ebSrANFnTGKDS1KnFPHMtESr2jBFZ0X2L4sLkrC/rG96uR+oU7dN6?=
 =?us-ascii?Q?gySIHpJui8E1Zgf2vDuOF9HHG5VcmAuAzQ7hP6qlLsVpsLyeftI3neA/ul/N?=
 =?us-ascii?Q?TpOwl9u7TZEiRgG7Vp3wboQ3WF0jx4Dy+cQmmA+szOD1GaIaiWuQtjE4kHLa?=
 =?us-ascii?Q?SagZCg=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c666b2-9d5e-4ab3-d9e8-08d9eadbf67e
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 08:21:10.5131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6vbMqKWZuJXbVTpLE6f6NMYYwL9il8VXyKheKKcEyWW5GCxZj1uHlF/r6o3CPpp2uDIxHB9f4EDWLYSecBqiYDHzlQ8Ri7y7M/aAcup9/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0965
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
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

On Mon, Feb 07, 2022 at 06:07:34PM +0000, Mark Brown wrote:
> On Mon, Feb 07, 2022 at 06:03:51PM +0100, Francesco Dolcini wrote:
> > On Mon, Feb 07, 2022 at 04:02:29PM +0000, Mark Brown wrote:
> > > On Mon, Feb 07, 2022 at 04:32:29PM +0100, Francesco Dolcini wrote:
> 
> > > > This control inverts the signal fed to the right amplifier.
> > > > This allows to connect one loudspeaker to the two speaker amplifiers
> > > > in a bridge-tied load configuration getting higher output power.
> 
> > > Is the value chosen for this not going to be a property of how the board
> > > is wired up, in which case it should be handled as a DT property rather
> > > than varied at runtime?
> 
> > Not really, in our board we do have a L/R loudspeaker connector and the
> > end user either connects a mono speaker to the left and right channel
> > and enable this control to get more power out of it. Or you can just
> > connect a stereo speaker.
> 
> > Enabling this control to me does not depend on the board.
> 
> What do the physical connections for the speakers look like in this
> system, and more generally what sort of system is this?  Most systems
> either have the speakers enclosed in the plastics with the rest of the
> system (which is obviously system specific) or have jacks/binding posts
> for connecting speaker which are labelled fairly clearly for one
> intended use.  If this is some sort of raw/development board that's
> something where it's expected that people should be willing to configure
> DT for changes at the level of wiring tihngs up.

For the speaker output we have either a 2 pole screw-less terminal block
connector (for BTL mono output) or 2.54mm pin headers (including ground,
in this case) for a stereo loudspeaker.

In addition to that we have the usual 3.5mm jack for the other
audio inputs/output, but they are not relevant for this discussion.

In general it is a development board, Toradex Verdin Development Board
V1.1 [1] (the picture on the website unfortunately is from a previous hw
revision in which we had a different audio configuration, anyway if you
are curious the schematics are available), but we do try to make the end
user experience the most smooth as possible, so what you propose is not
really appealing to me.

Said that, if the only viable solution for you is to have a device tree
property would be acceptable to not have any in-tree dts file using it?
We might decide to have it enabled with an out-of-tree dts overlay.

Francesco

[1] https://developer.toradex.com/products/verdin-development-board#tab-design-resources


