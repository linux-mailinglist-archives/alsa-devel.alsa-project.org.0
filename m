Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 025AF65FE7A
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 11:00:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7D2814311;
	Fri,  6 Jan 2023 11:00:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7D2814311
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672999256;
	bh=kRrZ02LPDD15pdvjvSQ81o9PlCGdZLjhXZeJ1me0QcE=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hZZJPw5VcTAldZpDR3NG2IefETJSoJIsDmrwHJ1ZF0+wx6UcmU/+Rli8EYKR7AY2w
	 R/Bs3zYOoWbH/apEwPo571B7coIrxCk2QezRdNwbHD6vXB+kR5x6x2OjhlV7WWV202
	 iv/k1+Ck9SOUpUDwyxc1WLVb0Ht0a8wlcacIkAo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75DAFF8024D;
	Fri,  6 Jan 2023 10:59:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0713CF80238; Fri,  6 Jan 2023 10:59:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-sl2kor01on2040.outbound.protection.outlook.com [40.107.129.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18084F80217
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:59:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18084F80217
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTkLawmwZ/eTT+inbPrG8pFcj5YbSuw04x0vrPaZbQd6SI5pW6gwCl1GuKjzJq2QV3DPpSTMfTadxbGkO2HiTNY025XB8v68R1H469uLL9MN/zVe3SxTNMAnqkupEuFXR+z8FGfnJjk6qSGaE+QekS2TzsDH2Td5QTSlWZjyz25pC6pa0eHvOp/RJyI0oSliJmQanhtLLQlFrYbD5PB4LFtS5fAmDVKESqlR2HiQVBXyipYR7K8TulhxSfJewFzmtxNF7vaysdzfLgQMX+SvCEma2HZZtGtO4MzSqZT5ay3yJaV9Fm05mU/PCvpjvzgv5BGiiNyFOFPFJgoAV9/Jgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZ0xdaLvZiMpLVMAE140wuOJj9MTjN9OSowUeISDkvk=;
 b=esVCNaPx4P0jSeER617BOCUw8VxxHknIjCdMx6Dt7Bl6wNp+zI9L3wfAx+gas/MoMWByy4MD37riQ9GgP2ppYw6C0niLEy1hmp2g89BqdhYcKuXMnT06MpnLZ1OXmPRuOo0fZFF0c63nrq7y5lC6vpYOXGMDaJXI6KhLChgBKiMkmCZAy4FDSxctMh/EY/WU0TUw6E93wNvuj7jscqXBHCEnJribGfhsdjUIWOP24HxUJYaziY68tfqIkU6Osw+WP+aCw/UdC2X996tBpnoGQCRAS+ZD9rUaCaTtYOkQwBrzpfWY4YQ0fo7sd9gjCmmQeqnlxzGfJ5Tdc7YFsg9YNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 SL2P216MB0586.KORP216.PROD.OUTLOOK.COM (2603:1096:100:1b::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Fri, 6 Jan 2023 09:59:49 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 09:59:49 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Dan Carpenter <error27@gmail.com>
Subject: RE: [PATCH 14/14] Fixed the retry_cnt bug about being zero
Thread-Topic: [PATCH 14/14] Fixed the retry_cnt bug about being zero
Thread-Index: AQHZIa9/JWAeJIF1MUqWJln1Q6zi8a6RHuqAgAAAsICAAAci4A==
Date: Fri, 6 Jan 2023 09:59:49 +0000
Message-ID: <SLXP216MB00771E0ECD5CF40E339F17418CFB9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
References: <20230106091543.2440-1-kiseok.jo@irondevice.com>
 <20230106091543.2440-15-kiseok.jo@irondevice.com> <Y7fplQ18qyhKDC44@kadam>
 <Y7fqKTurjruCKw97@kadam>
In-Reply-To: <Y7fqKTurjruCKw97@kadam>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB0077:EE_|SL2P216MB0586:EE_
x-ms-office365-filtering-correlation-id: 5bb6f51e-4daf-4fae-c33b-08daefccbf8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FFiHjH7dwGbIIciVsGrdzWJAmOzfPTWF9D1/UnSGaQRjxpbdUQ2bHYTwxAVeEmmUZo4UbETVOqRlqmmSjz2xKR9d0y8Tj8iZWL9qmz5vQY78XDMXWW+UI7YnA6IItTlYQXI8XRQybC+uude2l+Dh+Qpu9snX5hCi3QS0UUm+erO7upRDPcp9bMB2wyeXqFYKfT9w3Qe9MOuS9FhiwwHi0C1GewQ0iH6gOykYIe9vPV3IzrwbwNeWlC5ReP/Wf69gEKKZFmkhgSmuwnExy+s256l0cKILl0LWMxkeHoc6T7LGSoA2jWfU250nJmhgsR+jXTbTil99DBH75ZKUQlX3XtaCbZ16SUYmtrJKf5K3oCExebypvkOos8RsyLWX23li3Mo1EtHeD5JwFGU9XYK90sqZkI655APu9vRAc7CMHoIoVLEiXVIr/3RKnsZlMfstCpXIRun4AQXs3nFYvfDPyNJGB88TufZNC8iPbLizmrL5ZCLSVMzrAq/tsZHdsvrzHcpuE1+Td82vFViKTHfbNDE94HkavyoMIvp/YfRpjjEzW5vumaN1solbKOvgRrv4Hvdr7zyyOjuwafRkjmO/GS5srTXp+BLhh+3Bgfsf3pZ1CHDbG15FxTxL9W41XfR9t3U65OeG8zg0qT+2NHJX7LgQDTBd+CXhSLh08bpKskkPuSUx0z1fBq0mAhZ4fzfDG8Q8TV82u/Qr43SbXo+HVw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(39840400004)(376002)(366004)(346002)(396003)(136003)(451199015)(64756008)(66946007)(6506007)(4326008)(66476007)(76116006)(66446008)(38070700005)(41300700001)(66556008)(8676002)(316002)(86362001)(6916009)(54906003)(26005)(2906002)(186003)(7696005)(478600001)(9686003)(52536014)(38100700002)(4744005)(33656002)(8936002)(5660300002)(122000001)(71200400001)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?F4hMex/hQMFj0k6uPaPMnoTlSNwYmBw06dhk7Fj7NaboY0VwhJ0bJeK6duh0?=
 =?us-ascii?Q?bSLgkKIRghTxUXD77NJ9XFn2YKpWWn66ECk7MsBbTaa/bbk4zWMtIj2TKiiC?=
 =?us-ascii?Q?xKuMTYBde72PPYxsQTOXb0aFvd13euoxJ4DGIPUgQeAcLHo2BBZWAGBXNKgx?=
 =?us-ascii?Q?jtsmQGkXEDg+iEJIihSzx5OQ5RtcZLhRRxqIlUOQxX3kSTdpDtrTETOER186?=
 =?us-ascii?Q?s9aqNhieJsQQYCTgJ+9qAwZK1YT6mylSDxhkRL5a4uwpiHr5gj3aeWBN+yXf?=
 =?us-ascii?Q?SrwXTitLa5hi7kNJonPyzjMjRbA5AAiUsbSj0oqibN0BbnSCvDgWgZLDeuJP?=
 =?us-ascii?Q?WXnt13W/qO4GA93F7KmB7H7w3uV+OpQhB8RRethGH5aAI2eeHm5Yib0Gopzz?=
 =?us-ascii?Q?2To1XJ4Qyi8BomQ/crE686wIq0JFlfCdj2s4YzMCIyZs1TmCg7rKbR0J2M8+?=
 =?us-ascii?Q?HwenlIQoEUx7fskgjIQaewWQoUnDbDT8Nf/wQ3MkjPu8m3RJ8rK8R7C8jW2v?=
 =?us-ascii?Q?mde9SeO7rNs+H7eqy6hwlySQ/4xYy7velW2hmIWNy2SwkNDrk+foMJAZsOQJ?=
 =?us-ascii?Q?tCnq4pp1IOmZ30ISoM2FnwxVknWAQUWx284C88Sc27rXny7YkSIVUCeIJukf?=
 =?us-ascii?Q?eL8+yD+hXRN3poaJy2auDwwepP6HwNZc4goEgkm9DT/vH/GKkRdxnggoJQH1?=
 =?us-ascii?Q?tdEWkHEStyAAHND3VG7lcpXvYeAnqiPgkhGnyMXjIAJi65K7R/546nD4/+4j?=
 =?us-ascii?Q?ukpQbcdagaF6uCZiCeVLgtWZvc812Ci+yYKcJpxbKw276eahpX0DtQxCM9JL?=
 =?us-ascii?Q?MAWS1AJnMYVxlJOewn8fmLqTbZJrgmFXN8AZORA7XKvGaJo/RirOVfTy7kMx?=
 =?us-ascii?Q?GaaWzVzEMo+K/ZEjKPPo7X/+Opi3ta0p9G0f9QuXPnevb0gnpnrxSA1uEpnm?=
 =?us-ascii?Q?j1YeuzpkJCYxJ0g3G8vs7Zr0ImhDBUwzZe2615xj8jnhs6bjVSd+TRH3XKoY?=
 =?us-ascii?Q?N2g2fsn9Dnco8RdDsztq1Dz3Z1xMrrBn8tF36YJ1P51ff/srIdNY+sp7aPJR?=
 =?us-ascii?Q?yYzfvGphK0uQvBLM/72x0hhjRCNaG9vgYYWA9HyC4pcfJmwWy8OCqoHOW9ex?=
 =?us-ascii?Q?cbZQRmFanwFHiH+xdAsckgpX726A2wYiBFrgXDSJjNDibIgRCbaMtP+7JdLN?=
 =?us-ascii?Q?XzYOyKJI5hOOA2V5sEzb0DJvlBkWsNrENKk1cvnezQjAgSTPulszcsZW0Xp7?=
 =?us-ascii?Q?khd1Kg7Jgia2SM+4nSP5LcMrs9bUt6r2lm2clqTvC72qAOxzPUarQ4PCYcNe?=
 =?us-ascii?Q?yVr6g0kb7C5SeGhHtHykxm06eboryDOCIxSlzt0sLNNojyHovvOGJlymrU0I?=
 =?us-ascii?Q?HV6UTm5k/b2q6+XtdOm+llNFHdUA/TSUYIcx+JJKJYEZyGaNA1JeAdH8wmNN?=
 =?us-ascii?Q?65xv0to8btBBCxQ2FB72TUI6l+4QmqK5thj+3Fp3nkZDAoV0uuDb5ukJPfOj?=
 =?us-ascii?Q?bGeThXqazJqx9gI6rYXyMjZfiOwcGvaz1RxiF4h1TQXY9yX/LGMqKlXNtDOI?=
 =?us-ascii?Q?2b87VY0+/9VCNLCZEAsRy4SvqmqwVagrJANjOzk4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb6f51e-4daf-4fae-c33b-08daefccbf8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2023 09:59:49.1983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bCPgXb3Yhc2kC2TasXUjg1ohpGa6L212jzKemGVTxKqVeQ6LUtNXViOq10cHeSY/IqW0Ds6qF4lkeRiKzOxAyI0nV0RvD2qGdepKSCGhHOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB0586
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Application <application@irondevice.com>,
 kernel test robot <lkp@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> On Fri, Jan 06, 2023 at 12:27:49PM +0300, Dan Carpenter wrote:
> > >  	for (index =3D 0; index < ARRAY_SIZE(sma1303_snd_controls); index++=
) {
> > >  		sma1303_controls[index] =3D sma1303_snd_controls[index];
> > >  		name[index] =3D devm_kzalloc(sma1303->dev,
> > > -				MAX_CONTROL_NAME, GFP_KERNEL);
> > > +				MAX_CONTROL_NAME*sizeof(char), GFP_KERNEL);
> >=20
> > sizeof(char) is not required.  It's always zero.

> s/zero/one/ obviously.

I understand. I agree the value unnecessary. I'll remove it. Thanks
It was just put for the data type checking.

> regards,
> dan carpenter


Best regards,
Kiseok Jo
