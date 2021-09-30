Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C388E41D33C
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 08:23:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46BF916DC;
	Thu, 30 Sep 2021 08:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46BF916DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632982987;
	bh=4OxpsBsYK4ZgTwmPJ8MC/KFuEFBI2wXYR+HHMYe7KoQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EKiGQtP5tLv17OLrzy0spj0mFW1HaZfn7uzGE/l9eK4lklLmNUbbaTtXl6+pAVXBH
	 OxI4a8WB5OF1yYmpJ+FKA4i1HebvoYgF3ZHhQvAOsqDsRGLMR9L8UewNaNt795Jw0h
	 0vVR4NOvqA9wi/2usrNmemzt+HGbKdeQOEBYOF6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98F58F804BC;
	Thu, 30 Sep 2021 08:21:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C764AF804AD; Thu, 30 Sep 2021 08:21:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2131.outbound.protection.outlook.com [40.107.243.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 846C9F80113
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 08:21:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 846C9F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="VpCYlzME"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXgF6s0juqPkAbpXo6IDrgz52g6kYZJPtk22VhneBeJwjlRoa3L6dA1BlGV9No1jlHRghiHd3gIibc86zYzmpeMvSw9fJWKCSYlNTzdziHnzCetyOQrnnhxS4h+aop5glr+gMNeSP3J7A1jau6nAkvgsRCro9P+SOybeLDRXVfDjZjsbdZEU+vEoU+Y3fr5m+k4VQlFn2oLAil0yMGaQ2FB6ldiq5mMLp3SoeQCsHuo/iCi8d+EQmaYDInmuytaZhQXoj6l5eUTnMB5YgKk+W1mtL0ob0poCZKfXDXqxMKGydkWTvPkKTJPADm0MoWbOMpaLihD6PZAyYyMeyRGsOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=9c/jC9KE0y786MHqIFG1CNTrtAk/F3zV9Zm0aGrgyg8=;
 b=UvbVg48/2sSe/5MeLMsB782HqH+UOUZUE0RmDYOKju6Qrnz6owzGmuAvXaCI3vW0K2zNp85Asmohn1o4k1dMIpFQkrfJclIzNbYCdeN3glvujWWDAzfeR57dJQO1M9oxWwgQGakqMerLL4W/Sp7qfG/9BzYL122Jni51rpQtK5g9R+VSjht0UaqP+VD4Ng5zWm4cjdASWMJkOkOyB3+m8uSaNNImtDnZlAmQOcMtiJPSywchBYdW/NA/7oIPZ8ZsUwbkDS9cIBw3KGPP7SPSpyBrajy0GSF0fcZoNVsHd6jmWx0394m0IRmJgpxLYyryIwnozrAuzQo5y38evy51eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9c/jC9KE0y786MHqIFG1CNTrtAk/F3zV9Zm0aGrgyg8=;
 b=VpCYlzMEzGyP/d3NEplBHJaVWWS3n05qXp68eXyPc2YGFfjwwNtY133DN30q0r+eC3rUQwr/aytwpwPyhLk9Mk11RR6sgNuQ5a3Evm0HgcC+K5mRFlR1WlFQqiLgJwlMeOFy+1zEQxkn/fGYjKisGqzFCY5qr1wOO1FQJmX45Pg=
Received: from SJ0PR11MB5661.namprd11.prod.outlook.com (2603:10b6:a03:3b9::5)
 by SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Thu, 30 Sep
 2021 06:21:36 +0000
Received: from SJ0PR11MB5661.namprd11.prod.outlook.com
 ([fe80::31bb:4f91:1eb5:7178]) by SJ0PR11MB5661.namprd11.prod.outlook.com
 ([fe80::31bb:4f91:1eb5:7178%7]) with mapi id 15.20.4544.022; Thu, 30 Sep 2021
 06:21:36 +0000
From: Ryan Lee <RyanS.Lee@maximintegrated.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Mark Brown
 <broonie@kernel.org>
Subject: RE: [EXTERNAL] Re: [PATCH] ASoC: max98373: Mark cache dirty before
 entering sleep
Thread-Topic: [EXTERNAL] Re: [PATCH] ASoC: max98373: Mark cache dirty before
 entering sleep
Thread-Index: AQHXsZF45/jZbOMADUKIjx+r35kUIKu3/BEAgAAPiFCAAAR+AIAAC+UAgAAIKhCAACX/gIAD0nCQ
Date: Thu, 30 Sep 2021 06:21:36 +0000
Message-ID: <SJ0PR11MB5661A2F6089A9AEF4143C11CE7AA9@SJ0PR11MB5661.namprd11.prod.outlook.com>
References: <20210924221305.17886-1-ryans.lee@maximintegrated.com>
 <1b21bbf1-12c7-726d-bff8-76ec88ff8635@linux.intel.com>
 <SJ0PR11MB566107A6AB3D18ABDEDCF245E7A79@SJ0PR11MB5661.namprd11.prod.outlook.com>
 <20210927160622.GE4199@sirena.org.uk>
 <7b8c3875-3f12-f3cb-7da8-4e850e59ee2b@linux.intel.com>
 <SJ0PR11MB5661814BCC6B79EDE1B0967AE7A79@SJ0PR11MB5661.namprd11.prod.outlook.com>
 <c5031731-dd58-ff7a-857e-b9e1b748d3b2@linux.intel.com>
In-Reply-To: <c5031731-dd58-ff7a-857e-b9e1b748d3b2@linux.intel.com>
Accept-Language: en-US, ko-KR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=maximintegrated.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7895e20b-ca0d-43c0-12a3-08d983da8e7a
x-ms-traffictypediagnostic: SJ0PR11MB5663:
x-microsoft-antispam-prvs: <SJ0PR11MB5663BB76B912F4DB41419049E7AA9@SJ0PR11MB5663.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EfVRfAxqWMMnpuLPh0WD9qxNLmgSaWRDdrz9qJZQyOSxZ64syXo7DqIYr6kfn5DEhkXFx27Xdgej+Qh45/bpcYQxTI5wTKg+Qi+54VQudOf4jtSUljc+M2EoyDipaK1JTnoUuuwQp9DBp+f7iogRnD0Xm3ZzLFu0os7vA27KEw8l9nMWCijYoK3ww0YGus7nZh/DPqlLVg3MqAhMP+Dn0r31jindtu2Bm77W+/lehzRypAZKVxEMmRVMMHI9S+p4b9IerZGNOOssGMPP/4GayI0PxyxG81NCojsrKwNor2t/JrX0Ui1gL/VvAnB4twgf8T+JZ8bv7Bjpvv8U6XREbqzn4ueAc65jnZ1k902rBaOcJmO5rD5NzdhEVKu1hiKkY1AB2S/7BPxqN65qEwHd5iSFkd4G0giiFJkDQ5Ztx+OjTmQ5rZAltCbAggcoQfy0ThkLpNKGebEXiF+YsYa4fDJKHI0BDZrmkigf0esZoZ1TPo1ZAWaEDJrf4/JRbYrUT5Stf8LNe541lFE09ec/YA37wjp+bSCXFCpSX+nhUCPhrteBIPk8HnCvwYA4qORAc8HGw0n8lBEAuUzBPlOByAM5vSQqUQaixwbdLQfET1tQEawqE643+fiz5/qL+hXtDGbEN6yic1UKiF+YqHZx8S5CP0RRpPnfohhDp3MTpud5h1zvugWAIQeh0rwTh+yokdkzpqnxlREaFsu08i2MODS+Z22zr9d0acOzrZIqNukNZuaHBCkOXq4ePZZOym0C6ajHi+kJIgMe7yjlRGHaXiaeiC5q8nBt1Lrye7aUQgA1y7SOzCWnUgt+e5huHwgnrs68dAnELLcCWkB2HLSjwr6I3NjqDR2Q6diBhZ7ztb8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5661.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(186003)(66476007)(38070700005)(4326008)(8936002)(66556008)(66946007)(7416002)(2906002)(64756008)(66446008)(7696005)(33656002)(38100700002)(76116006)(5660300002)(55016002)(122000001)(52536014)(26005)(9686003)(86362001)(71200400001)(8676002)(83380400001)(110136005)(966005)(54906003)(508600001)(45080400002)(316002)(14143004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nkM5g1ZQbQJiF7i2EZImPrae6IV6b1duQ7erCip5q+OD36oTw2ZDbNrFg6cm?=
 =?us-ascii?Q?+IMSkytDlIaQWoTG8waQI+MJ0jYRaoXYksd2V5rrEdMT0w6FioqmYTUQ9N1Q?=
 =?us-ascii?Q?+l0llOdL0BuDnmVasjqw/SIY7hNIcWwlTwB8giTb0A8PimwriyovFAhRzzes?=
 =?us-ascii?Q?cvtJUwLfBvy8tg9Lutowyj/Ov+/uQsBqoRQrTPJ7t68M+pMWLSZ9NKgGlFju?=
 =?us-ascii?Q?KzO3EjEYkvf3vFYhHX8eJwFIocKxlN/dkscm2cOoMktGUw3Gun++Plv9a1Kv?=
 =?us-ascii?Q?6nLLFmVwyfJSQITnfXK6sxTDg3XgRySwCzz8OYbNjHrXU6cPl5nCXsqk1pMG?=
 =?us-ascii?Q?Xz5mwffGQovIvLCQMstgrDhcEZD6UvmrRl6xPb1Pzy1iRKeUwuvl+pLufmK8?=
 =?us-ascii?Q?tKcR3x2bwJCE6xlqdM/48pDoPosBWmTvzTUcLEkH/kBWGZFMmfV4B0gCwStU?=
 =?us-ascii?Q?K6bkoctY61DjwYZwAdzchKFoehfqnBHBlz/cK66k5oFaVFjbM+N83etP27QT?=
 =?us-ascii?Q?P82kXXKFg/IaX2aAmh+R2YzK0J3ROsDVUa4rUbNNj72FzBNASbhr6iOh75wC?=
 =?us-ascii?Q?0wxxXmd2LPi6HaixTixEiR8wuHuAG+EGKSyUVyZZ+g1eZEtjvNgWW/+sTpWO?=
 =?us-ascii?Q?ctlrIoqj3zkc2uvK+lYA6gTniuHMBLQTfjvCUOYbUEVz8pEIeBUB26B2icPr?=
 =?us-ascii?Q?XHvZl8chZq/Qhwn0x60hFHKHtPpOZcJN+3vqIRdpQaO7HpMgjhOTTy/0VZF9?=
 =?us-ascii?Q?tGsHCd7DIpYPiFVamIL96SPNwpfaxBXr+E9SrTR0jznVfMIDYLluJh9BYzzm?=
 =?us-ascii?Q?FKMY9QyMqKB1mf3ZectaUNSvegpDCF6lzeMeSDcRq4bQbm42hEEyJgOZ5e3m?=
 =?us-ascii?Q?TjQ6BuIwuWUzF9Gmol3qQUWpADnHq2WzO6QSYBYLWZhbFgTlCwK79Fqw/Dv8?=
 =?us-ascii?Q?CBZdFgNSwgMz1aVDbQqtQJ2VMQaTWz+cw/W8npcX26hG4BbKDMsAliVn5AqQ?=
 =?us-ascii?Q?3RmlOco8LrNsE/PukNJOiqPyu27gKLi/RhDN0NVc4llKjJnqKQaMumV9zxnn?=
 =?us-ascii?Q?Xi32Qqofr0xodYa9Jinl7W0Jj9Il2niTFlgogxjNC4ocbx8phVTQtN/i4OJF?=
 =?us-ascii?Q?vDKx+wgp9mAF3eqKZ8drOczc+2uoU4yWZLw+Z26TBcFLC7cAYf9X9tfxJHIK?=
 =?us-ascii?Q?31WxV+P0tyDWFA7BxBdwNUxNigGX3GF+iGA632rld+cDe0hcS8J5EYtR3KKR?=
 =?us-ascii?Q?8efWh6iOY8XhoQF5t88quheg3Qy7RjyQkBJZtGOPRYYTnQgK3QcXXbk4Lcaq?=
 =?us-ascii?Q?1EW6Lv8EXvhMJ8IkRnCVm7c6?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5661.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7895e20b-ca0d-43c0-12a3-08d983da8e7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 06:21:36.4496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EK5rU2FoyFIfTtdclQMd5nnUkjvUjpqa4uPYGCNd2vgflHdfY69Mz8lmfQrt82S/Fxj55O9AAsf39iZkk/5u13kTT3nmJ3uhXhOv98YulDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5663
Cc: "guennadi.liakhovetski@linux.intel.com"
 <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ryan.lee.maxim@gmail.com" <ryan.lee.maxim@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>
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

> >> Instead of changing the suspend sequence, can we please try to
> modify
> >> the
> >> max98373_io_init() routine to unconditionally flag the cache as
> >> dirty, maybe this points to a problem with the management of the
> >> max98373->first_hw_init flag.
> >
> > max98373_io_init() is not called because ' sdw_slave_status' remains
> '
> > SDW_SLAVE_ATTACHED' and 'max98373->hw_init' is already true.
> > Removing 'if (max98373->hw_init || status !=3D
> SDW_SLAVE_ATTACHED)'
> > condition in max98373_update_status() function instead of adding
> > regcache_mark_dirty() into max98373_suspend() can be an
> alternative way.
> > I think it is all about where regcache_mark_dirty() is called from.
> > The difference is that max98373_io_init() really do the software
> reset
> > and do amp initialization again which could be an overhead.
>=20
> that description is aligned with my analysis that there's something very
> wrong happening here, it's not just a simple miss in the regmap
> handling but a major conceptual bug or misunderstanding in the way
> reset is handled.
>=20
> First, there's the spec: on a reset initiated by the host or if the devic=
e
> loses sync for ANY reason, its status cannot remain ATTACHED.
> There's got to be a 16-frame period at least where the device has to
> monitor the sync pattern and cannot drive anything on the bus.
>=20
> Then there's the hardware behavior on resume: on resume by default
> the Intel host will toggle the data pin for at least 4096 frames, which
> by spec means severe reset.
>=20
> And last, there's the software init: we also force the status as
> UNATTACHED in drivers/soundwire/intel.c:
>=20
>         /*
>          * make sure all Slaves are tagged as UNATTACHED and provide
>          * reason for reinitialization
>          */
>         sdw_clear_slave_status(bus,
> SDW_UNATTACH_REQUEST_MASTER_RESET);
>=20
> But we've also seen the opposite effect of an amplifier reporting
> attached but losing sync immediately after the end of enumeration and
> never coming back on the bus, see issue
> https://nam02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%
> 2Fgithub.com%2Fthesofproject%2Flinux%2Fissues%2F3063&amp;data
> =3D04%7C01%7Cryans.lee%40maximintegrated.com%7Cb9f84a1267ec4
> f50b7a008d981edcc46%7Cfbd909dfea694788a554f24b7854ad03%7C0
> %7C0%7C637683680607026027%7CUnknown%7CTWFpbGZsb3d8eyJ
> WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
> %3D%7C1000&amp;sdata=3DrARkwTSB3DN%2BCYxGaehOhtCGEj1eLBl6
> Mk7QhynQSY8%3D&amp;reserved=3D0
>=20
> In other words, we need to check what really happens on resume and
> why the amplifier keeps reporting its status as ATTACHED despite the
> spec requirements and software init, or loses this status after
> enumeration....Something really does not add-up, again it's not just a
> regmap management issue.
>=20
>=20
>=20
I do not see #3063 issue on my side. No initialization failure or time-out =
has occurred.

Now I'm trying to solve the issue with max98373_io_init() function as sugge=
sted instead of adding
regmap_cache_dirty() in the suspend function.
max98373_io_init() was not called from max98373_update_status() when audio =
resume because
max98373->hw_init was 1 and Status was SDW_SLAVE_ATTACHED.
max98373_update_status() do not get SDW_SLAVE_UNATTACHED.
I confirmed that the issue could be resolved if SDW_SLAVE_UNATTACHED event =
arrives at
max98373_update_status() before SDW_SLAVE_ATTACHED is triggered.
Actually sdw_handle_slave_status() get SDW_SLAVE_UNATTACHED but this functi=
on exits at
https://github.com/thesofproject/linux/blob/topic/sof-dev/drivers/soundwire=
/bus.c#L1765
before reaching to https://github.com/thesofproject/linux/blob/topic/sof-de=
v/drivers/soundwire/bus.c#L1825
I'm not sure how to solve this issue because this code is commonly used for=
 other Soundwire drivers as well.

I share the debug messages for the resume event as your reference.
[  127.490644] [DEBUG3] intel_resume_runtime
[  127.490655] [DEBUG3] intel_resume_runtime SDW_INTEL_CLK_STOP_BUS_RESET
[  127.490658] [DEBUG3] intel_init
[  127.490660] [DEBUG3] intel_link_power_up
[  127.490977] [DEBUG3] intel_resume_runtime SDW_UNATTACH_REQUEST_MASTER_RE=
SET ..
[  127.490980] [DEBUG4] sdw_clear_slave_status request: 1
[  127.490983] [DEBUG4] sdw_modify_slave_status, ID:7, status: 0
[  127.490986] [DEBUG4] sdw_modify_slave_status, ID:3, status: 0
[  127.490994] [DEBUG3] intel_shim_wake wake_enable:0
[  127.491060] [DEBUG3] intel_shim_wake wake_enable:0
[  127.491191] [DEBUG] max98373_resume, first_hw_init: 1, unattach_request:=
 1
[  127.491194] [DEBUG] max98373_resume, INF MODE: 0
[  127.491953] [DEBUG4] sdw_handle_slave_status IN
[  127.491956] [DEBUG4] sdw_handle_slave_status, status[1] : 0, slave->stat=
us: 0, id:7	// UNATTACHED
[  127.491958] [DEBUG4] sdw_handle_slave_status, status[2] : 0, slave->stat=
us: 0, id:3
[  127.491960] [DEBUG4] sdw_handle_slave_status IN2 status[0] =3D 1
[  127.492808] [DEBUG4] sdw_handle_slave_status IN
[  127.492810] [DEBUG4] sdw_handle_slave_status, status[1] : 1, slave->stat=
us: 0, id:7	// ATTACHED
[  127.492812] [DEBUG4] sdw_handle_slave_status, status[2] : 1, slave->stat=
us: 0, id:3
[  127.492814] [DEBUG4] sdw_handle_slave_status IN2 status[0] =3D 0
[  127.492816] [DEBUG4] sdw_handle_slave_status IN3
[  127.492818] [DEBUG4] sdw_handle_slave_status status[1] =3D SDW_SLAVE_ATT=
ACHED, slave->status : 0, slave:7, prev_status:0
[  127.492820] [DEBUG4] sdw_modify_slave_status, ID:7, status: 1
[  127.493008] [DEBUG4] sdw_update_slave_status update_status(1) IN slave:7
[  127.493010] [DEBUG4] sdw_update_slave_status update_status(1) OUT
[  127.493012] [DEBUG] max98373_update_status IN hw_init:1, status: 1, slav=
e :7
[  127.493015] [DEBUG] max98373_update_status IN2 hw_init:1, max98373->firs=
t_hw_init: 1, status: 1
[  127.493017] [DEBUG4] sdw_handle_slave_status status[2] =3D SDW_SLAVE_ATT=
ACHED, slave->status : 0, slave:3, prev_status:0
[  127.493019] [DEBUG4] sdw_modify_slave_status, ID:3, status: 1
[  127.493199] [DEBUG4] sdw_update_slave_status update_status(1) IN slave:3
[  127.493201] [DEBUG4] sdw_update_slave_status update_status(1) OUT
[  127.493204] [DEBUG] max98373_update_status IN hw_init:1, status: 1, slav=
e :3
[  127.493207] [DEBUG] max98373_update_status IN2 hw_init:1, max98373->firs=
t_hw_init: 1, status: 1
