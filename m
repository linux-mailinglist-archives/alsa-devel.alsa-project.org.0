Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 028FF15ADF3
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 18:02:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 611A3167B;
	Wed, 12 Feb 2020 18:02:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 611A3167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581526974;
	bh=nYKOTAiZhsuFss35E3RwwB2nOtKzStGP8+nStRsYTeI=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fNjUh869pLwy6hqCHAkp2UwQJRRVBx1m3kaXGzr2Y9tcZ+0RYTCbQdGvza3qfBIK8
	 Ob1ubpaXSEmhnnE6O5I/qVGtQ3VJW/bwnAHDdYsS4sWZFJlK/9KuvVR5sDxDDcq0d2
	 4zC+f3GcXCDb3M4D9sx4v1Vgij37tfv2D7+SUriw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71F3AF8014F;
	Wed, 12 Feb 2020 18:01:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1AD8F80157; Wed, 12 Feb 2020 18:01:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B4BFF80125
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 18:01:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B4BFF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="IK9pxZec"
Received: from [100.113.3.77] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 65/3D-54715-25F244E5;
 Wed, 12 Feb 2020 17:01:06 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1VTbUxbVRjm3Hvb3iFdDgXSQ6UCdV/gWlox7i7
 bzIyE1cR9yNwfnbgLvaM1/cC2ZIUlZnyoFGRsDNxoKGOzRNwoYHGTMaYGjKNEHGMQYQKRrGOA
 oigoyEZnb2839c/J87zP+z7nOSfnkLioSCAhGZuVMRtpvYwfTmhThKnyjJS0TGXJdUAN3ezGq
 ObiUoyqmfTxqd6eQpz6ayhAb3XW8akOv4dPrTycwqiJtimcGm9ZJai2JTfY+YS6baGIr77iGB
 eoGzx56o+7ZjC154Kdr673vqpu/XyYUC94ntpHvs7TGbNMtkM87cS9y7zcxihbqX2cOAZKosp
 AOAlgI44qHxQBjnxLILurGONIO0D3K/7ms4SAvThqWKwPKiJYhSHf7bkQGQdo4kFFgKwh+ZBC
 p3p/Co5Ew08BuuavDjrjsA9HV2vb8TJAklFwPzrZRLID0fA15D9djHHYhAbGFoKYgOvRWF0Hz
 mIhfBN5J77mcbu5eGjs+AcC1mcNfAmdc8exPQBK0WLhxWA/DsXotu9s0AdBiFxdN3AOx6CZO3
 4e188gb9EI4OqbUf8PvhBORF3fnwvNStHg2fJQfTfqW+gL4WS0cvV+qIdCrvL3CDYOguuQvzu
 fK+vR8PQAj8Mb0MgvpaEIcehibUvwKAi6CdR4vJA4AZSO/8R2BKxwmIRaO1O4ciKqLp8UOII3
 EYm8tT6iARAXAJVl1uVorQZap5erlEq5SpUqV8m3bFHQBXJaweTJsxmj1UwHRAV9xKKw5Buy9
 RqFkbF6QOAJat4BuzvATfdvim4QS2KyGOFsQlqmaG2WSZOvpS3at8x5esbSDeJIUoaEWfKAFm
 lmchjbYZ0+8JAfyYiMkEULD7Ky0JJLGyy6HE7qA1vJEzPO8zjZ7mwMrN+wq4gwmoyMRCwcZgc
 gO6DNMz62e/Q1BoFUEiUEYWFhoohcxmzQWf+vzwIxCWRRwhLWJUJntD7edTYQCAsEqkgKBrLS
 /0qSY9i+z1Kdp5Pmn7xSCXbGXnIb91eRvFWt4+EmDP6Ysp3fHb634M/1f4hXP/pK5mxR8Zol0
 S9MZZnemEkfrZ5/UdB/RvOzt2AOXRt6zjT74dzyweVs1UjzAf8zbunSnW1ltshdmwa+WEzY3P
 C7Y7UuQzDfceDd1qr4dTtG4s7YJjMlM7727Zobtl1NR7eOvp/cpah+pZYUJ9y6nLdBtG2ghFd
 jt/fugXcH6zw9lU0bpwWHv0x/marUxKc545cyNi6PP902fy/hSHKlpTPd3hYjkhqEPcqKX+fv
 To9Yvmsc9sDrz4fhO55dWUsl1nhOuuS2S/V+a6dyr/uo/9Dy2/2jhk/yY50ywqKlVcm42UL/A
 14sn0qVBAAA
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-6.tower-233.messagelabs.com!1581526865!1083509!1
X-Originating-IP: [104.47.13.51]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9140 invoked from network); 12 Feb 2020 17:01:05 -0000
Received: from mail-he1eur04lp2051.outbound.protection.outlook.com (HELO
 EUR04-HE1-obe.outbound.protection.outlook.com) (104.47.13.51)
 by server-6.tower-233.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Feb 2020 17:01:05 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auYkxJ4dhXxeKRbP8K/gga0OroGV5kAqkgIQOCLn/nplUw5B+9Z5LQY7yFBfVs/umdVU6iBZeR7inr5cZcSZz3R/qC0qMpX3qppmhUQwF4dJps78bikNbvK0Q40EZXfHU2HS5Rgfh23GaCqmBacsCKn3PTH1jTWoc5wt20O6x+lm3+fXYdbvH6T6tnt7oIvG8TjpoB7xO2nYkxZNjtMn0/z93405j4Mpa51AJ4cFOd9mglo2QQK1R2uBLEXJtQZGQ8BDPb5glPVINklFaMhbkedvJhFzEEdlu0yUoYoDbcGZHEWKRX2HxM1NLggJPWtybfnDWe8pljuqeDOrqf5/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhpGFwof2GNhCRRD26ntc9hHvmXKpz85pZfAR6EE2TY=;
 b=IlghsstShRM4h0i7Y4j/+N1COuZ+r3RT47rFTYIzxsuuTpvxyo2lRnUtt083AJoA7J6ZU/gbQfN7UPUHq73PEs2iJCPz6btx/JAGNSdWwfpAjct2XZS3mD/YFsgSc9Cf443ZiH+7G3VtJCTEi2+v1U7Vw2qy65Johlj5oJ2fge7wY95uNLUH7u/+L1YPcAoZY9enLmV0n4MRqfbNqO/gHRTngBrPffr8BcFbJaNch886I5YCs2U71ksZROKM6VWlyJvhBiZKPxdgk3UazDoIL4xmhJq0EmHdgOVKMmqPrdoLyjbNcPCPvZosYt2Ye9PAfczw3XfqhDK6oF1Rlfkv+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhpGFwof2GNhCRRD26ntc9hHvmXKpz85pZfAR6EE2TY=;
 b=IK9pxZec0qltlqVcKAQlgkbYJ6c78DwDVqs8fXXa0lnmwwbe4hcwaMqnyFomBXEsVF3i9kUn3MwJLE01AzqK+ocCD4p6http3M9rN+8ZrHsu2YVXacaW8F8D2ERWWG/6f1bJmw0iRmB7P7j6Zbuea7bhYjtPN76ca3HQTJJHusc=
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM (20.177.116.141) by
 AM6PR10MB2952.EURPRD10.PROD.OUTLOOK.COM (10.255.122.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Wed, 12 Feb 2020 17:01:03 +0000
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01]) by AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01%7]) with mapi id 15.20.2729.021; Wed, 12 Feb 2020
 17:01:03 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>, "Sridharan, Ranjani"
 <ranjani.sridharan@intel.com>
Thread-Topic: [alsa-devel] [PATCH] ASoC: da7219: check SRM lock in trigger
 callback
Thread-Index: AQHV3+t05QGFzNuez06VZ5VdF8K2kqgUfAmAgAFKeYCAAGrTgIAARPoAgAAJp4CAAAclgIAAAzgAgADQubCAAFzUAIAAEt9Q
Date: Wed, 12 Feb 2020 17:01:03 +0000
Message-ID: <AM6PR10MB22636A4193260B94F17EB9FC801B0@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
References: <1581322611-25695-1-git-send-email-brent.lu@intel.com>
 <AM6PR10MB2263F302A86B17C95B16361280190@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
 <SN6PR11MB26702B2E7E5F705425517F4897180@SN6PR11MB2670.namprd11.prod.outlook.com>
 <855c88fb-4438-aefb-ac9b-a9a5a2dc8caa@linux.intel.com>
 <CAFQqKeWHDyyd_YBBaD6P2sCL5OCNEsiUU6B7eUwtiLv8GZU0yg@mail.gmail.com>
 <2eeca7fe-aec9-c680-5d61-930de18b952b@linux.intel.com>
 <CAFQqKeXK3OG7KXaHGUuC75sxWrdf11xJooC7XsDCOyd6KUgPTQ@mail.gmail.com>
 <c9dbcdd8-b943-94a6-581f-7bbebe8c6d25@linux.intel.com>
 <AM6PR10MB22630C79D08CE74878A6A096801B0@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
 <043c8384-6ce2-c78e-f52c-6a37a4bab3a0@linux.intel.com>
In-Reply-To: <043c8384-6ce2-c78e-f52c-6a37a4bab3a0@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.85]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4598d1e0-e647-4365-475c-08d7afdd24ab
x-ms-traffictypediagnostic: AM6PR10MB2952:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB295218A3A4F6B07319F111F6A71B0@AM6PR10MB2952.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0311124FA9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(366004)(376002)(39850400004)(199004)(189003)(86362001)(186003)(7696005)(52536014)(26005)(66556008)(64756008)(66446008)(55016002)(33656002)(8936002)(2906002)(8676002)(4326008)(81156014)(81166006)(7416002)(71200400001)(478600001)(9686003)(55236004)(53546011)(6506007)(5660300002)(66476007)(110136005)(54906003)(76116006)(316002)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR10MB2952;
 H:AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4H933pgnTXGUvOLyVwxmuwDDvK/yw+AiwIwUN5XgnnDlv101OVNxG7B9/WlkyoQv4ciIZV5gVK/YA7BaxLsZ555qM/YIK8lWlcPw/lJQ3qOP7g1yN+SJN6wBo9cF0IQxIQbeK7Zpp+91rAM2AhMU6TdJJMAHMuuSr5PMNWWx48gOTkfPRTL+5Iv5oUBS79/cHv3zHazo/bM2z0SjgLlibvCx5d7xMtJpfRBuQad2bi0dym2TLi9ryBu5jScRrP+/NcpbOz60lww+jQtg26RbAFQ5G5WR4Oc+HYljauaIIhxCrDeuXt2tM4RivOGwWljjkESo1Ry4YykV3h/PR4nhGTiHGIlPl5oxESRtHAHcPp6vSTER5Ez/WMobYTU2wXdZBJ/j5gEaZIfgD9oVHnAAjT1TjmNPQLTE40bqwUuz6WfzgnRGZiMqTSKB/CA+Ww9+
x-ms-exchange-antispam-messagedata: VvVnlXU9e+ZaSI3Fkv/6y1Jc1DYZx8F+QgCoIBmBpRxNIApuUcReOn/68gNrzXCSyBo7wSY4v0dHGpZ61ev6iX7zw0ie5XROcXUDvXpXiYYbLCbITA+GUH1JCLSjeMZ3Q2JyXSNQlMwQKpYy7Hx5xw==
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4598d1e0-e647-4365-475c-08d7afdd24ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2020 17:01:03.2443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3aTMzBTjpFUAkcBu7VK13jgXRiQs2IC4buoqp2sGTPnZPe+YIt0+Bkx0X4lTH0Kr+8vCN5Skz3n4JtsMZERo1iRyxjpBBR6vpUfc83RHqPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2952
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Chiang,
 Mac" <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, "Lu,
 Brent" <brent.lu@intel.com>, "cychiang@google.com" <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: da7219: check SRM lock in trigger
 callback
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 12 February 2020 15:48, Pierre-Louis Bossart wrote:

> >> Thanks Ranjani. That information closes the door on the idea of playing
> >> with the trigger order suggested earlier in the thread, so my guess is
> >> that we really need to expose the MCLK/BCLK with the clk API and turn
> >> them on/off from the machine driver as needed. I hope is that we don't
> >> need the FSYNC as well, that would be rather painful to implement.
> >
> > Am not going to make myself popular here. It's MCLK and FSYNC (or WCLK as
> it's
> > termed for our device) that is required for SRM to lock in the PLL.
> >
> > So far I've not found a way in the codec driver to be able to get around this.
> > I spent a very long time with Sathya in the early days (Apollo Lake) looking at
> > options but nothing would fit which is why I have the solution that's in place
> > right now. We could probably reduce the number of rechecks before timeout in
> the
> > driver but that's really just papering over the crack and there's still the
> > possibility of noise later when SRM finally does lock.
> 
> Sorry, you lost me at "the solution that's in place right now". There is
> nothing in the bxt_da7219_max98357a.c code that deals with clocks or
> defines a trigger order?

I meant solution in the context of the codec driver. The approach or
expectation (maybe more suitable wording) for the driver is that the required
clocking can be enabled prior to the DAI widget for the codec being powered via
DAPM as part of an audio path. This approach has been there since the beginning,
for want of a better option, and I've always highlighted this need when
platforms are using our device with SRM.

You're right though that this isn't taken care of in existing mainline Linux
machine files that use this device with SRM.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
