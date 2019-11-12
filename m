Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6AAF954C
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 17:15:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E653165E;
	Tue, 12 Nov 2019 17:14:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E653165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573575331;
	bh=ZBFdgtnxKfXCLOa2RPBN3LSNb2ttPYJcJFULghoeWfQ=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i9TXSEXAQZFuY1NVw2IlrLsVnqQ2b119d/Rt0Ext1jDIVi/HzuaBSSndP46fvjAq0
	 CMdmdeqJcIxSMEvP5NComANCdcd8tMojJwimIbc3av+atQKemwB7BGWtAp7f8QVTD0
	 +zWzNGE93ek2iPOjW1uKwqvV08VRqTmgZfqMJ7KY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B398BF8048F;
	Tue, 12 Nov 2019 17:13:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D602EF80483; Tue, 12 Nov 2019 17:13:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8564F80144
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 17:13:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8564F80144
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="EcFYymuI"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcada330001>; Tue, 12 Nov 2019 08:13:39 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 08:13:39 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 12 Nov 2019 08:13:39 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 16:13:39 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (104.47.48.56) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server
 (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 12 Nov 2019 16:13:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfSqgmZ7Y65hpaIlDCT8cvgXpWwcjpbs3IuGjCpqdYBMdgT6dj+upfvCmkRsvG0MKRvr9D+v+OwN2fH6eR4kd+1PF1f7xBBmXxz+nKwEmDSAfH8KWaZkSLbAOEh/gj1LYSYyifAAsYabDqwzSszEsfnIHduXy8DBTHVcQkTnyt/vLf2hCkb1C5vX+Xs9+PMnQVFIANgQ1I7miaNByfnILLKUPAESRPZ4o0KLSxcjOSzQuD6f/JD9iM4o7721idz7XxNFk+LXLsChW8EaJ4ZUNa7aLsw5jqWQ9FJvbu9I4pUs/LSogFDMlwou92qOOHYPhCi07iZF8+ufYDmpEGCMwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKrfSK4AVXkdnQFIe5+d+ydR2IP4KMzjnn2tEMMWemE=;
 b=IMKcVNcWXU5daT4zNankcpw9Zp9UY4STxNwVKl7z7IzsxACTREkF1nJZdvGvWLesCgBEARY8hkfiSxPqmVXyKpZ5boRr8yw4YOGBx6PyGYT9u6YYSsXN5hBNzcKrvHwmfDYEUXzmnQP9O0bTpCZEWXeTwCUuz3IAT61it6x7oeYq4TBlQPsqbkLjjfapcjeIBdsZ5SEflug4NTjwVaq5NEJB4atcc3pVNUKKYukI45Pe29b1f04G7ErMTIm+nBb8PZXL5t8JoBoEHUT+yc53b7L0RA5soGpk3YXVPJGxSuw18u3NAfTeDobFWlw1VNf8IMOSycimx4Nsj62ObWRcGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB3389.namprd12.prod.outlook.com (20.178.242.161) by
 MN2PR12MB3934.namprd12.prod.outlook.com (10.255.237.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Tue, 12 Nov 2019 16:13:37 +0000
Received: from MN2PR12MB3389.namprd12.prod.outlook.com
 ([fe80::457a:dc11:397f:d4ce]) by MN2PR12MB3389.namprd12.prod.outlook.com
 ([fe80::457a:dc11:397f:d4ce%7]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 16:13:37 +0000
From: Henry Lin <henryl@nvidia.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: [PATCH] usb-audio: not submit urb for stopped endpoint
Thread-Index: AQHVmSWhBIS3uSZfiEG540j5JX9w96eHJDUAgACGuvc=
Date: Tue, 12 Nov 2019 16:13:37 +0000
Message-ID: <MN2PR12MB33897DF3AED495FCAF1F421AAC770@MN2PR12MB3389.namprd12.prod.outlook.com>
References: <20191112065108.7766-1-henryl@nvidia.com>,
 <s5hzhh15z4n.wl-tiwai@suse.de>
In-Reply-To: <s5hzhh15z4n.wl-tiwai@suse.de>
Accept-Language: en-US, zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=henryl@nvidia.com; 
x-originating-ip: [59.124.78.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57763a81-7a58-4c9b-35af-08d7678b4688
x-ms-traffictypediagnostic: MN2PR12MB3934:
x-microsoft-antispam-prvs: <MN2PR12MB3934FFAD1F24BDE691A1F31DAC770@MN2PR12MB3934.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(189003)(199004)(54906003)(26005)(478600001)(6916009)(229853002)(74316002)(186003)(102836004)(8936002)(9686003)(305945005)(6436002)(446003)(5660300002)(25786009)(76176011)(7696005)(99286004)(14454004)(476003)(52536014)(4326008)(6506007)(7736002)(316002)(86362001)(11346002)(33656002)(8676002)(71190400001)(71200400001)(81166006)(6246003)(66446008)(6116002)(55016002)(66066001)(3846002)(256004)(14444005)(2906002)(81156014)(91956017)(66946007)(76116006)(66476007)(64756008)(66556008)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3934;
 H:MN2PR12MB3389.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pcTjFESR4exjFAqzoceTE0K1m4IPzQ+6fu1Lu30S42VCF/FMhQJ4A/lXRKejbu/Qq72ZCEY33uPqVSFgkTVsVNVeDdvc8Vh4KsSkwvKOHcabwochp7lLpQqKS4xSALIkn/Rcc8ZzLApl0I1LVBGnj9IILP5ES1g6znWCT6TtHSgI76aLMRixtOZlL+5VZAWlPs2qtuw2RKPNkzx6aCZZAl+REzJ08Z67KKZOKeMvNbi66gL90HLzThAVHgeZ9kyqCvoj/Kh7qobt+ZvvWm/G0NfipFmAlYr4vscXyW4lByVyd7ykOQ37Uw03o16MT+vQg/JxEM3Qm2dpW0kPCJc4Y7A9Gcndq1rIoqJfDvXoQSXskr6tEphWw3bf4ka0U9ZiVKT60YC+ZYujXK943uZlJm4Z0w239lU4++1sSdcxhH3zYPhkG26INSWr9j/+lDcz
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 57763a81-7a58-4c9b-35af-08d7678b4688
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 16:13:37.6102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j3O7+DTQsp0UTvPPmbKz7iKfzvIRFPv5fgmWayySQTFHiijPd+cpxlBjkd7fwsx2SGWRrYo3xhbd6nyjoHY4iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3934
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573575219; bh=DKrfSK4AVXkdnQFIe5+d+ydR2IP4KMzjnn2tEMMWemE=;
 h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
 ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
 Thread-Index:Date:Message-ID:References:In-Reply-To:
 Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
 authentication-results:x-originating-ip:x-ms-publictraffictype:
 x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
 x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
 x-forefront-prvs:x-forefront-antispam-report:received-spf:
 x-ms-exchange-senderadcheck:x-microsoft-antispam:
 x-microsoft-antispam-message-info:x-ms-exchange-transport-forked:
 MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
 Content-Language:Content-Type:Content-Transfer-Encoding;
 b=EcFYymuIG378jPovUfUTnKIO6h+Kntx/5CeLMH0OkPlUvlC95U6h8AgHArQCM7A5J
 BohVmKeoSZxasnHC+PeXNJAkGn4w+obchC2QlMiPYmAUFqMsKNS0df3i0nmccIooGX
 QPWdJ3+UfCFRprDRXS1Pb5wYXryGn18+RX1pewVxpTICPafFWY468cJNUbGSd29elY
 rKgE3bRcObngnjYqE7Je/hjzRgehHVbcFCfdko627vTRObJmDJEZywBD8Tp1q0SFwV
 hDYHBv/NIAIohhjwd2Th14c5IEFPNjHh/Gq72r9SA9qi8JiKyZkFYSMqZWN8h2yYGQ
 ajx1tPHELd9ug==
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Richard Fontana <rfontana@redhat.com>, Thomas
 Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Subject: Re: [alsa-devel] [PATCH] usb-audio: not submit urb for stopped
	endpoint
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

>On Tue, 12 Nov 2019 07:51:06 +0100,
>Henry Lin wrote:
>>
>> While output urb's snd_complete_urb() is executing, calling
>> prepare_outbound_urb() may cause endpoint stopped before
>> prepare_outbound_urb() returns and result in next urb submitted
>> to stopped endpoint. usb-audio driver cannot re-use it afterwards as
>> the urb is still hold by usb stack.
>>
>> This change checks EP_FLAG_RUNNING flag after prepare_outbound_urb() again
>> to let snd_complete_urb() know the endpoint already stopped and does not
>> submit next urb.

>OK, this part looks good and understandable.


>> We observed two scenario have this issue:
>> 1. While executing snd_complete_urb() to complete an output urb, calling
>>    prepare_outbound_urb() let deactive_urbs() get called to unlink all
>>    active urbs.
>>
>> [  268.097066] [<ffffffc000af7638>] deactivate_urbs+0xd4/0x108
>> [  268.102633] [<ffffffc000af87fc>] snd_usb_endpoint_stop+0x30/0x58
>> [  268.108636] [<ffffffc000b0272c>] snd_usb_substream_playback_trigger+0xa4/0xf4
>> [  268.115765] [<ffffffc000acdbd0>] snd_pcm_do_stop+0x4c/0x58
>> [  268.121245] [<ffffffc000acda24>] snd_pcm_action_single+0x40/0x88
>> [  268.127245] [<ffffffc000ace984>] snd_pcm_action+0x30/0xf0
>> [  268.132632] [<ffffffc000acea68>] snd_pcm_stop+0x24/0x2c
>> [  268.137851] [<ffffffc000ad5e14>] xrun+0x60/0x6c
>> [  268.142374] [<ffffffc000ad7a98>] snd_pcm_update_state+0xa8/0x10c
>> [  268.148374] [<ffffffc000ad7e24>] snd_pcm_update_hw_ptr0+0x328/0x344
>> [  268.154635] [<ffffffc000ad7ed8>] snd_pcm_period_elapsed+0x98/0xb0
>> [  268.160723] [<ffffffc000b02510>] prepare_playback_urb+0x46c/0x488
>> [  268.166810] [<ffffffc000af7d60>] prepare_outbound_urb+0x60/0x1d4
>> [  268.172805] [<ffffffc000af8d60>] snd_complete_urb+0x244/0x264
>> [  268.178548] [<ffffffc00081fb38>] __usb_hcd_giveback_urb+0x94/0x104
>> [  268.184721] [<ffffffc00081fbe4>] usb_hcd_giveback_urb+0x3c/0x114
>> [  268.190724] [<ffffffc00084d4b4>] handle_tx_event+0x1304/0x1434
>> [  268.196552] [<ffffffc00084dbc0>] xhci_handle_event+0x5dc/0x788
>> [  268.202378] [<ffffffc00084dee4>] xhci_irq+0x178/0x280
>>
>> 2. Userspace application stops playback from sound subsystem with below
>>    call stack:
>>
>> [   28.506477] CPU: 5 PID: 1274 Comm: AudioOut_25 Not tainted 4.4.38-tegra #31
>> [   28.513430] Hardware name: quill (DT)
>> [   28.517085] Call trace:
>> [   28.519531] [<ffffffc000089a84>] dump_backtrace+0x0/0xf8
>> [   28.524837] [<ffffffc000089c44>] show_stack+0x14/0x1c
>> [   28.529885] [<ffffffc000401c54>] dump_stack+0xac/0xe0
>> [   28.534931] [<ffffffc000b35f94>] deactivate_urbs+0x148/0x180
>> [   28.540578] [<ffffffc000b37160>] snd_usb_endpoint_stop+0x30/0x58
>> [   28.546571] [<ffffffc000b410d8>] snd_usb_substream_playback_trigger+0xa4/0xf4
>> [   28.553699] [<ffffffc000b0c160>] snd_pcm_do_stop+0x4c/0x58
>> [   28.559179] [<ffffffc000b0bfb4>] snd_pcm_action_single+0x40/0x88
>> [   28.565178] [<ffffffc000b0cf14>] snd_pcm_action+0x30/0xf0
>> [   28.570568] [<ffffffc000b0fbc8>] snd_pcm_drop+0xac/0x140
>> [   28.575873] [<ffffffc000b0fc84>] snd_pcm_release_substream+0x28/0xb0
>> [   28.582212] [<ffffffc000b0fd48>] snd_pcm_release+0x3c/0x98
>> [   28.587686] [<ffffffc0001e3210>] __fput+0xe0/0x1ac
>> [   28.592469] [<ffffffc0001e3334>] ____fput+0xc/0x14
>> [   28.597253] [<ffffffc0000c2904>] task_work_run+0xa0/0xc0
>> [   28.602558] [<ffffffc0000897bc>] do_notify_resume+0x48/0x60
>> [   28.608123] [<ffffffc000084ee8>] work_pending+0x1c/0x20
>>
>> In the call path, snd_pcm_stream spinlock has been acquired in
>> snd_pcm_drop(). If an output urb is completed between the spinlock
>> acquired and deactivate_urbs() clears EP_FLAG_RUNNING for the endpoint,
>> its executing of snd_complete_urb() will be blocked for acquiring
>> snd_pcm_stream spinlock in snd_pcm_period_elapsed() until the lock is
>> released in snd_pcm_drop(). When snd_complete_urb() continues, all jobs
>> for deactivate_urbs() are finished.

>... but this part is unclear to me.  Do you mean that we have a
>deadlock in these two concurrent calls without your patch?
Above describes two different cases that endpoint is stopped before prepare_outbound_urb() returns in details. Listed two call stacks belong to different cases. Without this patch, both two cases will result in below error messages afterwards:

[  213.153103] usb 1-2: timeout: still 1 active urbs on EP #1
[  213.164121] usb 1-2: cannot submit urb 0, error -16: unknown error
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
