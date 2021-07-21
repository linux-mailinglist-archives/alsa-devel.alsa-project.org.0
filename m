Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5885D3D4681
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Jul 2021 10:59:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF74417D9;
	Sat, 24 Jul 2021 10:58:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF74417D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627117144;
	bh=Zk1WhCpNIBxj21y2bk3Bh7AyIN2cVu0LgkXvek1FRiM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YSnPAGTQ1F6h5EUGfimZOxwKVdr2+wyr6llHzfwsuCOQCndtfg/fpb3NsZYF3k3P/
	 C0QGT7nsH74xUtMkeo7WuaLcFmMKog9gDRue7SV7fNTIWWRlZXfGntca90eYzm8DOj
	 pcTkyF6QcERXlih7UiTLxmrZ0tu4PlUmCVhwcfj4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2F90F80520;
	Sat, 24 Jul 2021 10:53:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EC1CF804AC; Wed, 21 Jul 2021 18:17:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2071.outbound.protection.outlook.com [40.107.102.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31878F800DA
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 18:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31878F800DA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6AQbUxbrUJF4smYcL50sogoQMwlaWL/mVDuCwYzpwe35go4T4KBw1RlwuKxaM7We7jqoxpFVtuPGHJZSveuPc/EOKuVXET7shEYKBynm0oU9I0wWkkUbv+BvDmkXqFr+drXkqhUeAU/fCNXYTHcME46KI4o4j0WTBW/nzg6d9mY8jtzP3C8Zr8+vosvTii93ZV+0UGg3CTOFcTbKqHB4BxVRifQvO/YmskkFD4ZGAEeNMi3qQWPXkWBvLquG6o+NODIcsKrqlaGHKtD9M51myprwOu2eJI0e28+FCRnKVGZRHsQp0/A6TC3a68bZv5d45XcaQNZbMhpMNpRQLFT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRqQkUfpmvw4+Sj6F04mADQ2fNxbdcu8vTULBDbLNxw=;
 b=gsG4yg/zKXY8xTf1LOnxI0NAyHaXemKApeGyRifmwjXlBqdRvwy3ossmp8Ef/VTZizITfcmimaCrz42ADBAkV4N0v3cywPN5ASuQ3Wh11zN6XNFVVKEVWwuPqnAUc60l1DO5q9IcYtcfmT/LfWhwgKqufWXLIJdfD0x98qIuZUtVeO8ScbyVZUOwmfMu00eSS8CJeVDcPVAHKPUpTAA0M/hJoCBqxqGEvY1g0fQtUARSrnB0SuVSXeoE8QsuJrzrFlKf9AxOs3Q1dRmGPRd6dm8WTK5wrhg6wIMetbZG4URBpPepJ8rOJzLWtLUMWRwSyEcP8/tKo4X77vK6ERyZJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moorecad.com; dmarc=pass action=none header.from=moorecad.com;
 dkim=pass header.d=moorecad.com; arc=none
Received: from DM6PR11MB4441.namprd11.prod.outlook.com (2603:10b6:5:200::11)
 by DM4PR11MB5279.namprd11.prod.outlook.com (2603:10b6:5:38a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Wed, 21 Jul
 2021 16:17:25 +0000
Received: from DM6PR11MB4441.namprd11.prod.outlook.com
 ([fe80::edbc:920c:c539:46da]) by DM6PR11MB4441.namprd11.prod.outlook.com
 ([fe80::edbc:920c:c539:46da%5]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 16:17:25 +0000
From: samiam moorecad.com <samiam@moorecad.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Trying to debug in issue in my code
Thread-Topic: Trying to debug in issue in my code
Thread-Index: AQHXfkq1d4f8XJsTdESaPvVj91v7qQ==
Date: Wed, 21 Jul 2021 16:17:25 +0000
Message-ID: <DM6PR11MB4441DD575A3395FC92D4AB1BB3E39@DM6PR11MB4441.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=none action=none
 header.from=moorecad.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5e13d4f-65eb-4d3f-de53-08d94c6306fe
x-ms-traffictypediagnostic: DM4PR11MB5279:
x-microsoft-antispam-prvs: <DM4PR11MB52799F80806C134FA3C23E42B3E39@DM4PR11MB5279.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D3p7+LZne86KBVwhE9KkpRnlrSk+lWSDz+n7RXiT+AXSGAZRBmlrIE/cPGEAdGD5/PjtEx0e+tCi4CfxdzSyOl+xGmPNCnT7UIdIAmZ2/92+nqXv4acZYc5QkCXZnELPvr0nwSBee9Q8DFjzLd/1miut1tIH/bdze3xzMIt89vsTjHI0OBibBYLnfm5nqn98l1jxhrtv+LYCCZjSKgjLjj7RiTL9ooFHKhj0FWDWVB23f8/s++Zu+xywkThh0vl8e4NmJaTsePOHXVpjVFkeZy0kXYggVCziyoE+Xik3EJQtcrwsI8aIICYDsVWPoA1UuXJqkrvk72waQzcqizeG0dBckE4p58LNabi7hlHhSFln9AY3Wa+m1thxS/9fn+ZOKkw4PjlJTtclsjgpko2AxzebX0RzUc6TK27ikmlnL5S/U+3oX+1ED541AWMMNrYkq8qISevBAWvvFwNdzqnhZ3FYc27bDmaZ18CR4lnMVWeP2CPnzaXUGaDC3zXm37ZAjrxAAdY95Ch7w6HR7iTUfu547XlhKW59hwwqJg7prIf6vIIvh9NExJFLaj9VE0wDSMxdUeoQGB+kcJfkqEdJnzlLSMZDjyfnDlanhzeHWpHzFZ+Eszce8/a0FT/wIyAIeQzWOOiG9kTi76Gh/241cMyXcE5+hi9TNCTDzEPSKVEC8NNsPnx1Lk4rhF3Fq7ZnPXqkDNy7LYTymbE2Gul5gg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39830400003)(366004)(346002)(396003)(136003)(376002)(66946007)(66556008)(66476007)(7696005)(9686003)(33656002)(38100700002)(6506007)(83380400001)(316002)(52536014)(6916009)(91956017)(76116006)(86362001)(55016002)(2906002)(478600001)(8936002)(122000001)(5660300002)(64756008)(186003)(8676002)(71200400001)(66446008)(19627405001)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?WoIw0IwWbaV2n027IyoIl82VminQJws+pqtN+UqrbP0sj2V0/VOH7Ucpno?=
 =?iso-8859-1?Q?cfZ/5KtqCEXXXvlPH1OXjF9aCzgMdQPJoCkHWvlkh06sfkqL2xoKdjVGdv?=
 =?iso-8859-1?Q?Fotj2blkN7xPHaH8GRYex8xCYnY2Zy1ZUzWnNaoZDUuMKSQfdyyz9qdD91?=
 =?iso-8859-1?Q?Thhr98Yq7WzeKTxpcEA+XO6stPM6wHDvvv1fw7tJJjH5muTL33GP7etqW2?=
 =?iso-8859-1?Q?IwUFWHNGK76/NvPQalGxpK8408vxkmUfL2U/hvgKjtvEZMxx4FhB5F2SHC?=
 =?iso-8859-1?Q?Hi7W5SFYFuDilpitRwiYhthgHiSWzrshCNDS/tqUJifPgKVlWmVGUklENR?=
 =?iso-8859-1?Q?jn6Sgv+vq/C44zPXfEOFLSV37UreYU53vDGtlb94JMoGHyhzqCkdEK3pzW?=
 =?iso-8859-1?Q?l3Ot/BA89/ihLlqSFl2HhfTmkjSvAr1Xufmjknlo4sqcq+IXnqE8M2yrk/?=
 =?iso-8859-1?Q?D2gs6q73SLSnFwvGkASYiqIaESeiLf3LqL81CYsh6U4eIs67rw3wEgjqTp?=
 =?iso-8859-1?Q?wNVDOe7f/51jb/0mCsO0/Rs+3XOh1mA8v/S2k6nICN+cheA669/OKQhoB9?=
 =?iso-8859-1?Q?zHhyctGwWOUQp2ycEsUGhxXgg5oFNecB8XaJnSSaEDR3NdJMFuS2WO9c0X?=
 =?iso-8859-1?Q?xeWkJ8NYqwQW49iKDJwKFf36FmWIq3R8yiGLK9NjFpzWsLWQCa1L02NE+M?=
 =?iso-8859-1?Q?E97j/iGJji4OPpfmjP0DZiws7sO4r01ihr2spTneXIRNAj3S7iT8IQGr+P?=
 =?iso-8859-1?Q?AqMSSJ4ZZuNzf088vdepumc8Fir5PvOPhtCbEHQKWU3lgaJnpu3qNERucv?=
 =?iso-8859-1?Q?yrTSHYYRIt8zO0PM4UQ3ao6AumqtnTpAxGF2edS7YMsS7YIk8xfLNU4mme?=
 =?iso-8859-1?Q?31n2MFentWf+HknYwZQSYoZcF1lpKI/BdkA4VknT7lWNxRIod5Otabe4T1?=
 =?iso-8859-1?Q?FCh7JhIWePyneGJEvDte7OFnPRkvr1AwEc4Cxx9Zq9lfOIR19D/HNS1ABd?=
 =?iso-8859-1?Q?cQMQv2S8jb7r91oqK7rZIgK28s6Wl50Hm3ZfvJYUcpEkulPFGp3lCN55uk?=
 =?iso-8859-1?Q?ye4g+08eiNlMxqcJX+uAEpnZa7VWKmmLFp/YmxVx1ACmiKlNcWSqVX6hpz?=
 =?iso-8859-1?Q?lNvbNyCmpl6Fybt3qs6dmNexPeqJddx8kd5KSgtAL3thEzZuE0lsg/uyMW?=
 =?iso-8859-1?Q?SR+xn8ZPUVrS0P9z8ThJA+bS1wPtxjqGgNHAPV4ZsEo0tthv7kKQH6fqBv?=
 =?iso-8859-1?Q?DaOk7Kl4Zi44BUWBhm7TWTNF7cKj/fMqcLq6G6wWS6P6PTo5pGbCNMKXZG?=
 =?iso-8859-1?Q?OoRpLKeXYCKQRTea2IyYL3mzbo0ksTqHKvkU0j+MvhylumB2uextxjp0IC?=
 =?iso-8859-1?Q?bRHVV+wnYM+8DBYO4LaD+79vrlP+PVCbPtWOQDVVHSsrcJfA6OA5k=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: moorecad.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e13d4f-65eb-4d3f-de53-08d94c6306fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2021 16:17:25.1046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3e1a4a0f-8d6d-418f-8504-bf1b2aa65eda
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zS2mO1vW0FqsbooVhyiAVyrCZSuae0SKhKN4c2S6rqIj4rSIIEJIIvFiDKqdELsiWRZsmcSoihXIy5W5WUDbqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5279
X-Mailman-Approved-At: Sat, 24 Jul 2021 10:53:22 +0200
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi, I am trying to debug an issue in my code, and want to gain a bit more v=
isibility on the issue.

My crash is:

Thread 1 "connectwave" received signal SIGSEGV, Segmentation fault.
0x00007ffff7dbfae2 in alsa_lib_resampler_process_int () from /lib/x86_64-li=
nux-gnu/alsa-lib/libasound_module_rate_speexrate.so
(gdb) bt
#0  0x00007ffff7dbfae2 in alsa_lib_resampler_process_int () at /lib/x86_64-=
linux-gnu/alsa-lib/libasound_module_rate_speexrate.so
#1  0x00007ffff7dbfd79 in alsa_lib_resampler_process_interleaved_int () at =
/lib/x86_64-linux-gnu/alsa-lib/libasound_module_rate_speexrate.so
#2  0x00007ffff7dbe22d in  () at /lib/x86_64-linux-gnu/alsa-lib/libasound_m=
odule_rate_speexrate.so
#3  0x00007ffff7d2ac52 in do_convert (dst_areas=3D0x5555558b4820, dst_offse=
t=3D0, dst_frames=3D45812269, src_areas=3D<optimized out>, src_offset=3D<op=
timized out>, src_frames=3D1024, channels=3D2, rate=3D0x5555558b4650) at pc=
m_rate.c:526
#4  0x00007ffff7d2ba30 in snd_pcm_rate_read_areas1 (slave_offset=3D<optimiz=
ed out>, slave_areas=3D<optimized out>, offset=3D0, areas=3D0x5555558b4820,=
 pcm=3D0x5555558af8e0) at pcm_rate.c:557
#5  snd_pcm_rate_grab_next_period (hw_offset=3D0, pcm=3D0x5555558af8e0) at =
pcm_rate.c:826
#6  snd_pcm_rate_avail_update_capture (slave_size=3D1056, pcm=3D0x5555558af=
8e0) at pcm_rate.c:971
#7  snd_pcm_rate_avail_update (pcm=3D0x5555558af8e0) at pcm_rate.c:996
#8  0x00007ffff7d101e2 in __snd_pcm_avail_update (pcm=3D0x5555558af8e0, pcm=
=3D0x5555558af8e0) at pcm_local.h:436
#9  snd1_pcm_read_areas (pcm=3Dpcm@entry=3D0x5555558af8e0, areas=3Dareas@en=
try=3D0x7fffffffd5d0, offset=3Doffset@entry=3D0, size=3Dsize@entry=3D512, f=
unc=3Dfunc@entry=3D0x7ffff7d1c110 <snd_pcm_mmap_read_areas>) at pcm.c:7437
#10 0x00007ffff7d1c560 in snd_pcm_mmap_readi (pcm=3D0x5555558af8e0, buffer=
=3D<optimized out>, size=3D512) at pcm_mmap.c:203
#11 0x00007ffff7de5bea in rdalsapcmin (p=3D21, buff=3D0x7fffffffd6a0 "\250\=
327TVUU", len=3D512) at linux/sound.c:1735
#12 0x00007ffff7dec5a3 in pa_rdwave (p=3D21, buff=3D0x7fffffffd6a0 "\250\32=
7TVUU", len=3D512) at linux/sound.c:5462
#13 0x00005555555555a4 in main (argc=3D3, argv=3D0x7fffffffdfb8) at sound_p=
rograms/connectwave.c:106

I gather that the target routine of the crash, alsa_lib_resampler_process_i=
nt(), is in the alsa-plugins module, so I downloaded alsa-plugins-1.2.5
just so I could gain some insight into what the code is doing when it crash=
es. I should state quickly here that I believe the crash is my fault,
but I am just trying to figure out why it is happening.

I was unable to find the routine alsa_lib_resampler_process_int() in that p=
ackage. Also a ./configure followed by make does not
work on it (goes to the idea of substituting my own compiled .so for debug =
purposes):

/home/samiam/projects/alsa/alsa-plugins-1.2.5/usb_stream/pcm_usb_stream.c:4=
80: undefined reference to `snd_config_get_card'

Although obviously I didn't put a lot of effort into making it work.

DId the routine alsa_lib_resampler_process_int() get eliminated in later ed=
itions of the plugins? or am I looking in the wrong
place?

Thanks in advance,

Scott Franco
San Jose, CA

