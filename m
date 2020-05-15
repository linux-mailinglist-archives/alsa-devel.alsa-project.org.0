Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ADE1D49CB
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 11:38:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 692231666;
	Fri, 15 May 2020 11:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 692231666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589535497;
	bh=PNnYtELDPYwtT2xnAAkB9/vbfw7pEkHDmK/4K8Idj68=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LiRPEtzHfx8nddFOsJyl98wZddzMWtH1YYryJqqaoBrP5x2Q0qQNv4vAR+K7jQzcW
	 yqkPxyhUrDrBoRoxneJ+qwuheGN61EX1cIcWX8o5eHXoFepaICpuH1cVOLyzbusj/D
	 O5vwZ7373UUSXgxwHEWftiNKLoCXJI+HH1Df8eYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83588F80253;
	Fri, 15 May 2020 11:36:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8854FF80247; Fri, 15 May 2020 11:36:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC0BFF800E3
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 11:36:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC0BFF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="avdCBF2W"
IronPort-SDR: 0DzQpLLkcrsm4R6hZr6F4XwlLlC/ho1aKJsMrwP2ja4wYVkfcIhg+V6bLHkkFXMhnenKyAS0wI
 6T1rVFhyNmvA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 02:36:24 -0700
IronPort-SDR: 6BhB9/u9DR8e/cGd/LUB14QOSmZ1rv+guUbsViPcJvd3iqtbfTXTM9s7pUjH5dJXpV0xSFf0+M
 xmXXxWW1FhzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,394,1583222400"; d="scan'208";a="281164078"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga002.jf.intel.com with ESMTP; 15 May 2020 02:36:23 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 15 May 2020 02:36:23 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 15 May 2020 02:36:22 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 15 May 2020 02:36:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 15 May 2020 02:36:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SC4oe2FiKsaJWEQ8egatIzSBknQg6xre9qfoGRLN7PvIoJ9jDgR3HLM03uunDVgTh83nqeD503QO75VZFRG45akEXOxMpsZ7QSv0H6JGGCwE2hzfEypwp3n2KVYrybFWnr6lt5dJO93jpCfQRei5ryV/+dLh8Keqp87YP2Gnz31cGz3+8oB/7EdrilNTiXeMJZ0p+xNjPzocH9i+EtVA7xkIiG94Z4kYZtPlesOJL+PBN3hvEigeaNVn7mxkgProAZ81d6vo6aTCKz+jo4GPXH4UinrWs0zAaca6OsYRrYyg6UhgUQCVjrTO4TAggeyfFoSz4Kb9/N+x0oBI3wY4VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mc4oHmxLkj+COZgzHs4Hn0gUMMqKtQUcuyMmhRIl8yE=;
 b=I4nDiYvtFKndYicd2QzUlpl/tJc0zLWBVetcWzqvHcqRLHAJmWAOnO6WVfZabWTQxk6rrmmUSwHBKJGA16WLTrGE0oAjGmk9FHot8twksWzgn9cHSs5QH09+JX7mWfbjf22nTEqd/yp9JY8vjL1HLYWjD90hFam5Slq3ZLFremzyU7Z+++2QFs7/bpHoPjC2BgbWmBUT5qF4tsapKT4p8s5qFmsL5hkUUWKRqy6ZTSV7c1xNZgQFvdYp0j05DbaxMCqBpQLXfgVa70Y5W3Vk9+q+Gj2cCs2sKDynbP/SGrQaYPGoNOEIxDVXiDWopYeC2ltQDpRAnX+687J0wF9vsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mc4oHmxLkj+COZgzHs4Hn0gUMMqKtQUcuyMmhRIl8yE=;
 b=avdCBF2WPnH1XjVRMuBIvQnHlPHXDTYkYqDZKPFXoUDNWZMDajHD6/uNeYLYBfKJQp1XgdAbzQwnyCG72FcXqD7WPVY8ShJ8s5wbjckRGikpDb4ZsEghDpg9jnX6Uu0/q+SqHf5qOF7t07jHOMh5B/rQkW0FJIatha/75L5iI3c=
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 (2603:10b6:405:5b::22) by BN6PR1101MB2276.namprd11.prod.outlook.com
 (2603:10b6:405:4e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26; Fri, 15 May
 2020 09:36:19 +0000
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::5419:a938:2a3:ee27]) by BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::5419:a938:2a3:ee27%5]) with mapi id 15.20.3000.022; Fri, 15 May 2020
 09:36:19 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: RE: [PATCH] ALSA: pcm: fix incorrect hw_base increase
Thread-Topic: [PATCH] ALSA: pcm: fix incorrect hw_base increase
Thread-Index: AQHWKm+bGJ7M/VYc4UytQzlLp6XFraiovfEAgAAdJVA=
Date: Fri, 15 May 2020 09:36:19 +0000
Message-ID: <BN6PR1101MB213283BD74AA4477B18C96CD97BD0@BN6PR1101MB2132.namprd11.prod.outlook.com>
References: <1589515779-20987-1-git-send-email-brent.lu@intel.com>
 <s5htv0hoe8p.wl-tiwai@suse.de>
In-Reply-To: <s5htv0hoe8p.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=intel.com;
x-originating-ip: [1.164.110.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e7285f2-8025-4794-c04c-08d7f8b36c59
x-ms-traffictypediagnostic: BN6PR1101MB2276:
x-microsoft-antispam-prvs: <BN6PR1101MB22765261A764FD2B54A6650797BD0@BN6PR1101MB2276.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04041A2886
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZqUSGwm/q4rppWAFaL6qmujVCtOoqP5jbHFduFa2i2lMbZclLKmJX8jwr/eWrCNR34MZXiGtWvrhPWDqoRHjaRwCE8lRGf9MJQqAXdhQncUxZ8vkz3zJJu7MYoExnYEkYcRLJb4c62ypzNS63yA3JpEc7lzN6rygE4d/Gqu/XTOuh/10v3Q02oKIlaL843oXPfrWqL0QGDCJsqu9MU5QfsSI9Jp8Re2qWlK0gFQiAxYg3f8NOT6iDNP+He7YAcq9e07SYwhHzKZrN1CgES5Onp2W8k2hS3uomIphbsNtvD4fZ0sjActiUom8atgd/sselDoZyUSMJDVjguTGO/PI3q8gbq4r/j3E6f0e4aQWZ4GjAlwiL/1n1V4ShJvUXHeBPbIBOQNvRmvdg/amZ2gYNs6k2U0DRT5bAmc9gMQYCB5r/VUlctGZyJ6JOIsxzT8nfnolPRYjlG3FHXCcFo7XwiQDIcyggcB8xRbL5PCmBFAZqESiF1mwCAuuw99tY48YfQR4apyqBk8Ibg+WKsHnFA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1101MB2132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(376002)(366004)(39860400002)(346002)(136003)(2906002)(7416002)(66556008)(33656002)(86362001)(66946007)(5660300002)(4326008)(7696005)(52536014)(76116006)(6506007)(66476007)(64756008)(66446008)(316002)(71200400001)(26005)(54906003)(478600001)(8936002)(966005)(8676002)(9686003)(55016002)(186003)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: +dL070QRSsOw2JAjbuyjXGeud6/bevlRQahTakPNEGrhZ+1kZF3+7EA+M6GAY4goSwcNlhi3aUxsO4xSdYs0lCKWphm2ACl0afF1CvH+PuszXjEopQ0Pjiv+Yqkywio1K31Aei3OhlGbuwJ5uKZBz/tHrkFOt98GIAhEcBxC4m4OjqCQ6JzFegVVqpXKTFqXH31oefg1Y77X23r8G6THrMNdr/mTiAtvIT0VD4MJoE5a78fdUAKv3omC7sg8hBn9ugUxoIJl7KmouKxl6aeOK56hXPMkDnZJLvAbsh42q+GtFzgdmexfgH56Hyt0X07trc7qx8T0rJmtCGUzlj2wWZw2CIPgQfeOqP3b/R/TxYD4VtxvQoRi8f+tQ9gr4rtR1+suYGzy3u81NO90EIzCMDS6SIazDxvj5B4O+Yd/iOsB1cpyePxHkFTno5gFqoUbt99nabHsUNpDwY/zwzymjbM/hfJPG6fqfPd+i5QElqY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7285f2-8025-4794-c04c-08d7f8b36c59
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2020 09:36:19.5270 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KGIVusJfUE1JjYC2T+nnS3yi7KwckDlQAK13yGWKRSq4w1YChTDc5NK1TC24Hrr3YdpB9se6j2Hn7wwGojR1ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2276
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>, Baolin Wang <baolin.wang@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Richard Fontana <rfontana@redhat.com>, Thomas
 Gleixner <tglx@linutronix.de>, paulhsia <paulhsia@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

>=20
> Updating hw_ptr_jiffies at that code path looks correct, but it still lea=
ves the
> question why this condition happens.  It means that the actual hwptr isn'=
t
> changed and yet only jiffies increase significantly; it means that the ha=
rdware
> can't report proper pointer, and it should have set
> SNDRV_PCM_INFO_BATCH flag, then the jiffies check is skipped.
>=20
> With which hardware and under which situation did it happen (and the patc=
h
> fixed)?
>=20
>=20
> thanks,
>=20
> Takashi
>=20

From time to time we got questions from google about why sometimes the
snd_pcm_avail() returns a value larger than buffer size. Recently we finall=
y
found reliable reproduce steps: it's on Intel GLK Chromebook Fleex with
SOF firmware. There is a 1/20 chance the audio playback to HDMI fails.

From the FW side we observe a buffer runderrun, the FW is not able to
recover it for some reason and stops the pipe.

From the Linux side we see the pos does not increase because the FW stops
receiving data but suddenly the hw_prt is increased by buffer_size (16368).
It could make snd_pcm_avail() reporting a false underrun to the caller like
following log:

2020-05-09T16:08:32.712042+08:00 DEBUG kernel: [  418.510086] sound pcmC0D5=
p: pos 96 hw_ptr 96 appl_ptr 4096 avail 12368
2020-05-09T16:08:32.712043+08:00 DEBUG kernel: [  418.510149] sound pcmC0D5=
p: pos 96 hw_ptr 96 appl_ptr 6910 avail 9554
...
2020-05-09T16:08:32.883095+08:00 DEBUG kernel: [  418.680868] sound pcmC0D5=
p: pos 96 hw_ptr 96 appl_ptr 15102 avail 1362
2020-05-09T16:08:32.883104+08:00 DEBUG kernel: [  418.681052] sound pcmC0D5=
p: pos 96 hw_ptr 96 appl_ptr 15102 avail 1362
2020-05-09T16:08:32.883109+08:00 DEBUG kernel: [  418.681130] sound pcmC0D5=
p: pos 96 hw_ptr 96 appl_ptr 16464 avail 0
2020-05-09T16:08:32.929330+08:00 DEBUG kernel: [  418.726515] sound pcmC0D5=
p: pos 96 hw_ptr 16464 appl_ptr 16464 avail 16368
2020-05-09T16:08:32.929512+08:00 DEBUG kernel: [  418.727041] sound pcmC0D5=
p: pos 96 hw_ptr 16464 appl_ptr 16464 avail 16368

Or it could make snd_pcm_avail() returns an invalid number and confuses the
Caller like following log:

2020-05-09T16:08:33.054039+08:00 DEBUG kernel: [  418.851755] sound pcmC0D5=
p: pos 96 hw_ptr 16464 appl_ptr 27390 avail 5442
2020-05-09T16:08:33.129552+08:00 DEBUG kernel: [  418.926491] sound pcmC0D5=
p: pos 96 hw_ptr 32832 appl_ptr 27390 avail 21810
2020-05-09T16:08:33.131746+08:00 ERR cras_server[1907]: pcm_avail returned =
frames larger than buf_size: sof-glkda7219max: :0,5: 21810 > 16368

I've submitted a patch to fix the issue in SOF side. However, I think it's =
also good
to fix the incorrect hw_base increasement in Linux side.

https://github.com/thesofproject/sof/pull/2926


Regards,
Brent

