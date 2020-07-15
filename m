Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D1B220E00
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 15:22:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 249851665;
	Wed, 15 Jul 2020 15:21:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 249851665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594819320;
	bh=O8ISzvfRk58tTtmChIWZ013cYvJV6L7FPRX3fT1sbWU=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uRuA+Fzdi1SXNEuKSJ60glrrltIw+4NN37gFBthjTJMyEKMapIzXkrvOP74NfTOBT
	 5XQ8R7YL7Mx7HX/PAy+EjdpXgcpCzXiUdVTqcTL6AfxkedsBayhgYIhK8F1CXmjOhv
	 nJTHNSfCDG11YAe3QWW2XFK7dhn0zdZnKTnIr3MI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FA64F80227;
	Wed, 15 Jul 2020 15:20:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDEF6F8021D; Wed, 15 Jul 2020 15:20:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEC04F800E8
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 15:20:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEC04F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="F9esrbb7"
IronPort-SDR: CKWgxl0XL0AaI6cQj0n3tuAw2dSFC8K4GgWky2jhp7LfjiiWBvSPnvTnqNjqBHt8OXJ1q+GjWY
 ORKTqQ2nfKkQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="148293664"
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; d="scan'208";a="148293664"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 06:20:02 -0700
IronPort-SDR: moE6y1HqHGrlDEizgM61et7Wq9dHWJMBSJXIOpfw4kVtoLB0IEKfbw1iFd3VmkFYX5iOioLnXt
 DcUJNIcccr8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; d="scan'208";a="308248053"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga004.fm.intel.com with ESMTP; 15 Jul 2020 06:20:02 -0700
Received: from fmsmsx121.amr.corp.intel.com (10.18.125.36) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 15 Jul 2020 06:20:02 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx121.amr.corp.intel.com (10.18.125.36) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 15 Jul 2020 06:20:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 15 Jul 2020 06:20:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1KzKTYW6PLwoJFI4Rvwq6n21uH3b+6voxicjS/kYFyaLcUcutivUv0lsaUpqftXVbrNtYwoHWd0cpJk8gLStvpDvngw1UMDHa8qQTd1e8fyQQ5D5ZbAYJgz/j7u7rHRnpsw2dK07uzJuCjsJ3mMGEg31ZpevU4kTsAif1tfzuOjQVIoV19eFggkgk0MG3MgS1/xCdFs7h2ZtxM2vbfiEnj1K0gaROf3i8l1kyyaBkdc5JAZ2wz/rQeyXJeL+1tYPdnszPNpoW1Hmb5JelT3ofI4JbNGM7gKUyrvDUTV3C6zv4dN2chAzmsuhqv0E1SNUDERRD2I+N2LoHhHuTo8ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iB2iriPcLiAW1FzrjUscU+Zb+qTaIEj7qN8Zoz9YaU=;
 b=jQW1LWJov8mkoCejpxqDQUL8F/cXmiL/nXjgLz7c2trSCkb2mofxZAldoaABpsepsk1pLoj0BjN+i79WmA465lzXOVjV88XMpXk4P7OSCjWSVgTKkgzQFm5vHNK8fruyTKst8rizHMiScdWPk7zRcUHb57I3rlPDcaR/RHpBwl0I4UYoDUeg+4Te4egy9Vy2F6eK6ed3CWZMDa2ORiKVZoa7aaG2Ts1a9533FsYz6wwVjuSM3yc1t3q6VD3Tqu6uvuR/HWC1H3HKjGhdTWt+cWlrGhE5c6mi/kUgflD8OHRLILejvVu96ZO3jqNipvWD1R/H11ZOTvBKYDsaOxq/Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iB2iriPcLiAW1FzrjUscU+Zb+qTaIEj7qN8Zoz9YaU=;
 b=F9esrbb7KP3WMsfmfiGWPnuHbGBr6kvYz8/DE32v4GqYEao8wEr2sJ+udgNjecZ8m504V8QX9TNeZ98FcO6J4qKvKrBvMEuvpA3Cq6aYx0QdLgRBMIUCaV/g0/OrdTXOov3ehFt1uZABVK+wgAhDSPNlPDjnaxUOXG9xhmllQws=
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DM6PR11MB3162.namprd11.prod.outlook.com (2603:10b6:5:55::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.24; Wed, 15 Jul
 2020 13:20:01 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::29db:26c0:5600:9a71]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::29db:26c0:5600:9a71%7]) with mapi id 15.20.3195.017; Wed, 15 Jul 2020
 13:20:00 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: hdac_hdmi: remove cancel_work_sync in runtime
 suspend
Thread-Topic: [PATCH] ASoC: hdac_hdmi: remove cancel_work_sync in runtime
 suspend
Thread-Index: AQHWWqjj+SSA3bL+AUWljc/twgb3qakInO+A
Date: Wed, 15 Jul 2020 13:20:00 +0000
Message-ID: <DM6PR11MB4316967F812F23DE1AB8761C977E0@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1594818110-786-1-git-send-email-brent.lu@intel.com>
In-Reply-To: <1594818110-786-1-git-send-email-brent.lu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: alsa-project.org; dkim=none (message not signed)
 header.d=none; alsa-project.org; dmarc=none action=none header.from=intel.com; 
x-originating-ip: [36.230.200.112]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a051ca51-c340-4e51-9113-08d828c1c741
x-ms-traffictypediagnostic: DM6PR11MB3162:
x-microsoft-antispam-prvs: <DM6PR11MB3162681292DADC5761DB6CF8977E0@DM6PR11MB3162.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TD743Sbxh5yx9vcSIOGFAVZ74STNtI3ggXBvHUb36us/D5cDV/Q1RVEFFSR4Z74qhTL6o/v4Zfe83+wkoDsYMA47ihVhNK0trfHkHZOO37RZCgKu3aT8Y4n6tEs6UbkFl0qDDqOxgBAlNGWM8juT/x6oZOcb6gYxfwPVDhFjTs8h+G46tzPIvcpfQGfkdts/gkGFrGQ6XaIb4HkiQVi6e7eH6LAThhG9HRh84yy8zx5lDcLw1leEa8J0uBrpsmUQz7nCQ5iDava1o3IOlXp69EEcPLl+N4G52j0/4OZgUEp9VA/3Exs08xb0729GcCfeYciYPlI4xi9K5IddO4fApI4uKAcNqyna9TXFZR2YpTH4beMwwdcA1yLMANfttwC7zZTOYAZUBkYd9OM8fjIE9A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4316.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(83380400001)(186003)(5660300002)(6506007)(26005)(8676002)(316002)(8936002)(86362001)(66556008)(7696005)(7416002)(52536014)(4326008)(71200400001)(33656002)(2906002)(478600001)(9686003)(55016002)(76116006)(6916009)(66446008)(66476007)(64756008)(66946007)(15650500001)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: jG68jn+UnKOOsF8+eMxU0fzaJHWkVVuoHci0aiq4xgKvTRneY/celh3TX1yMuqw0FSMIQQ1+gEyJkur23XZ/IcV6gLgdTeu5R6sW6IA+mWaGgEwancZB7ZHwMdeKI3lT6aQ/btIuSCJljCUKyN0cAMXjp8OtXIEMNbIV6aZVIuGXxU0gBXFWGEiTO11RxUUL+FhQ1fR6KWLBZ4bCtekeaiqHltYm+M1eWgzMGM71+lAV/tsnAwU9FPtOUJr/ojW/hJ7PXRzAqV+dDxx43nuZh3DL228+w1p39qWArsM2Cxbz2orHKkiiiMMZxdzMQa9B+cEC/eElgMbNXtJN9TivksK275ZhMBfa9uKC8MP5DR3aJJEIawvc1i6XeX5KPF7jQRsV0aVtcF8kZoeat6BmSpoUdmju36S327twUCaNyJew44Vlb78N3O8dHDrgC7xl+DM4DAQBkLZtYmKkZ0seq+P4489lRenCErnKvrjSheB6HuJo6tFaW6Fy3lvLbRgp
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a051ca51-c340-4e51-9113-08d828c1c741
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2020 13:20:00.8268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WYNKFwjYMVkUU/PUY1qLtHU7gFdOX38JijI2rvjAES8WLdBD9P93up5uj30Xx+oGX5JE4BqkEBBjGqMg7yrQRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3162
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 =?iso-8859-2?Q?Amadeusz_S=B3awi=F1ski?= <amadeuszx.slawinski@linux.intel.com>
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

> A deadlock is identified when there are three contexts running at the sam=
e
> time:
> - a HDMI jack work which is calling snd_soc_dapm_sync().
> - user space is calling snd_pcm_release() to close pcm device.
> - pm is calling runtime suspend function of HDMI codec driver.
>=20
> By removing the clear_dapm_works() invocation in the
> hdac_hdmi_runtime_suspend() function, the snd_pcm_release() could
> always returns from dapm_power_widgets() function call without blocking
> the hdac_hdmi_jack_dapm_work() work thread or being blocked by the
> hdac_hdmi_runtime_suspend() function. The purpose of the jack work is to
> enable/disable the dapm jack pin so it's not necessary to cancel the work=
 in
> runtime suspend function which is usually called when pcm device is close=
d.
>=20
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---

It is found on CML Chromebox 'Puff' which is using Chrome-v4.19 branch. Ker=
nel
resets itself because tasks getting stuck in mutex for 2 mins. Following is=
 the
reproduce steps:

1. Connect to external HDMI display.
2. Open web page "https://bitmovin.com/demos/drm"
3. Reload the web page multiple times until device reboot

snd_pcm_release()
- In dapm_power_widgets() waitng for dapm_pre_sequence_async() to
  complete.
- Holding the card->dapm_mutex when calling
  snd_soc_dapm_stream_event() function.
- Call trace:
 [ 1352.228063]  __schedule+0x4b8/0xf5c
 [ 1352.228074]  schedule+0x3f/0x7a
 [ 1352.228083]  async_synchronize_cookie_domain+0xb5/0x11c
 [ 1352.228091]  ? init_wait_entry+0x2e/0x2e
 [ 1352.228101]  dapm_power_widgets+0x1eb/0x3b5
 [ 1352.228111]  snd_soc_dapm_stream_event+0x80/0x92
 [ 1352.228121]  dpcm_dapm_stream_event+0x58/0x7c
 [ 1352.228130]  dpcm_fe_dai_close+0xa3/0x118
 [ 1352.228141]  snd_pcm_release_substream+0x72/0xbc
 [ 1352.228148]  snd_pcm_release+0x3e/0x9b
 [ 1352.228156]  __fput+0xfa/0x1ef
 [ 1352.228166]  task_work_run+0x7f/0xa7
 [ 1352.228174]  exit_to_usermode_loop+0xa5/0xa7
 [ 1352.228182]  do_syscall_64+0xfb/0x14b
 [ 1352.228190]  entry_SYSCALL_64_after_hwframe+0x44/0xa9

dapm_pre_sequence_async()
- In rpm_resume() waiting for hdac_hdmi_runtime_suspend() to complete.
- Call trace:
 [ 1352.227903] Workqueue: events_unbound async_run_entry_fn
 [ 1352.227908] Call Trace:
 [ 1352.227917]  __schedule+0x4b8/0xf5c
 [ 1352.227926]  schedule+0x3f/0x7a
 [ 1352.227934]  rpm_resume+0x16e/0x5ee
 [ 1352.227944]  ? init_wait_entry+0x2e/0x2e
 [ 1352.227951]  __pm_runtime_resume+0x6b/0x83
 [ 1352.227959]  dapm_pre_sequence_async+0x2c/0x8f
 [ 1352.227967]  async_run_entry_fn+0x3d/0xd1
 [ 1352.227975]  process_one_work+0x19b/0x4c9
 [ 1352.227983]  worker_thread+0x10d/0x284
 [ 1352.227991]  kthread+0x138/0x140
 [ 1352.227998]  ? process_one_work+0x4c9/0x4c9
 [ 1352.228006]  ? kthread_associate_blkcg+0xbe/0xbe
 [ 1352.228012]  ret_from_fork+0x1f/0x40

hdac_hdmi_runtime_suspend()
- In clear_dapm_works() waiting for hdac_hdmi_jack_dapm_work() to
  complete.
- Call trace:
 [ 1352.228359] Workqueue: pm pm_runtime_work
 [ 1352.228379] Call Trace:
 [ 1352.228396]  __schedule+0x4b8/0xf5c
 [ 1352.228410]  ? delete_node+0x74/0x1ab
 [ 1352.228426]  schedule+0x3f/0x7a
 [ 1352.228442]  schedule_timeout+0x11f/0x176
 [ 1352.228461]  do_wait_for_common+0x118/0x164
 [ 1352.228477]  ? console_conditional_schedule+0x28/0x28
 [ 1352.228494]  ? queue_core_balance+0x75/0x75
 [ 1352.228509]  wait_for_completion+0x4c/0x58
 [ 1352.228526]  __flush_work+0x112/0x1a1
 [ 1352.228540]  ? insert_wq_barrier+0x118/0x118
 [ 1352.228556]  __cancel_work_timer+0x9f/0x1ad
 [ 1352.228569]  ? __switch_to_asm+0x41/0x70
 [ 1352.228582]  ? __switch_to_asm+0x35/0x70
 [ 1352.228596]  ? __switch_to_asm+0x41/0x70
 [ 1352.228613]  clear_dapm_works+0x3f/0x60 [snd_soc_hdac_hdmi]
 [ 1352.228627]  ? hdmi_codec_resume+0x40/0x40 [snd_soc_hdac_hdmi]
 [ 1352.228642]  hdac_hdmi_runtime_suspend+0x20/0xac [snd_soc_hdac_hdmi]
 [ 1352.228654]  __rpm_callback+0x8a/0xf3
 [ 1352.228669]  ? hdmi_codec_resume+0x40/0x40 [snd_soc_hdac_hdmi]
 [ 1352.228680]  rpm_suspend+0x3b4/0x73e
 [ 1352.228696]  pm_runtime_work+0x5d/0xa0
 [ 1352.228708]  process_one_work+0x19b/0x4c9
 [ 1352.228717]  worker_thread+0x10d/0x284
 [ 1352.228727]  kthread+0x138/0x140
 [ 1352.228736]  ? process_one_work+0x4c9/0x4c9
 [ 1352.228746]  ? kthread_associate_blkcg+0xbe/0xbe
 [ 1352.228761]  ret_from_fork+0x1f/0x40

hdac_hdmi_jack_dapm_work()
- In snd_soc_dapm_sync() waiting for waiting for card->dapm_mutex to
  be released.
- The mutex is held by snd_pcm_release(), deadlock here.
- Call trace:
 [ 1352.228835] Workqueue: events hdac_hdmi_jack_dapm_work [snd_soc_hdac_hd=
mi]
 [ 1352.228845] Call Trace:
 [ 1352.228860]  __schedule+0x4b8/0xf5c
 [ 1352.228878]  ? mutex_spin_on_owner+0x86/0x94
 [ 1352.228896]  schedule_preempt_disabled+0x47/0x8a
 [ 1352.228911]  __mutex_lock_common+0x25c/0x52c
 [ 1352.228929]  __mutex_lock_slowpath+0x20/0x26
 [ 1352.228946]  snd_soc_dapm_sync+0x1b/0x4d
 [ 1352.228960]  process_one_work+0x19b/0x4c9
 [ 1352.228976]  worker_thread+0x1e4/0x284
 [ 1352.228994]  kthread+0x138/0x140
 [ 1352.229007]  ? process_one_work+0x4c9/0x4c9
 [ 1352.229021]  ? kthread_associate_blkcg+0xbe/0xbe
 [ 1352.229036]  ret_from_fork+0x1f/0x40


Regards,
Brent

>  sound/soc/codecs/hdac_hdmi.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/sound/soc/codecs/hdac_hdmi.c
> b/sound/soc/codecs/hdac_hdmi.c index f26b77f..9052edd 100644
> --- a/sound/soc/codecs/hdac_hdmi.c
> +++ b/sound/soc/codecs/hdac_hdmi.c
> @@ -2097,8 +2097,6 @@ static int hdac_hdmi_runtime_suspend(struct
> device *dev)
>  	if (!bus)
>  		return 0;
>=20
> -	clear_dapm_works(hdev);
> -
>  	/*
>  	 * Power down afg.
>  	 * codec_read is preferred over codec_write to set the power state.
> --
> 2.7.4

