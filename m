Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D471B8572A
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 02:11:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A0CF83B;
	Thu,  8 Aug 2019 02:10:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A0CF83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565223100;
	bh=a/Rafk3Re3Gd1OOrm8rAJacErzjmogrO2u5+bjL351M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LzJgzjwJaiHb4IfpV5/raNA+8pu77m2P3crlvmuk7GQ+b0W5HG4eUQaaxSsqfYdnm
	 fbFqUrqV8y3BDHRKQkB6J3kOBbLYNK4WwIc7Ml09PJdsquAx9jrdf5ELA+Lg0Ws+CN
	 WBGMnUgITp1g3tKpgk9k3cu4C8Eez0+pb7Ybb2UM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4712F804CA;
	Thu,  8 Aug 2019 02:09:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0CD1F800E4; Thu,  8 Aug 2019 02:09:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,PRX_BODY_135,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0a::626])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0382F800E4
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 02:09:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0382F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=artgroupspa.onmicrosoft.com
 header.i=@artgroupspa.onmicrosoft.com header.b="GoWrRygr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+1H+D7Se53UTicd7fs0LWiA/az6r9OeUYWXz5Vg6k5ET1db5tA++yq7QzF1GGkihsm9l3UNc2w03KF2sgsO4VVyoYLMoQBPdlERjXJoe3hTqg1VI06DPHKnIc46H+AYT3EExsI0vFbinuqw0nA9BD0zTuG8MDJpNUN8/eE2AQq8sefFsZK2LLTKvBxekom/CPiG/vXSekIi2j5QNZkZ59j/siyWH9L347ILLSVt6YmiUhmYU8mXQsZBr5+QKHIdn9bt6NbnseLfpNUVf3S4Hh4srljnMhnWkVEPbIx0oXfdGB3qO5YrzU2UVTg1wf1c4nmRP+yRkfqTBBOT4MW8/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVtw2R7HWHW+6ju1QPn08JSJOzkYNxlfhwqA12EE1PM=;
 b=iEC5r+N8leLSy/7Hr/sQazI9y819/ytHTgIZpZhAkcEyevpNcuLY8GNkE4AXzwPAjlu+tu1mYfe4bezASjKZURwMi2axg4y8z9IIg/Mp+0S9VRYoQ2o4i3Zow2CceYy3quu4+m3CMSum1/KgRWwWlvLJ9JSr9xn0RZfWYy2K62vyZhm268fl7R1VRHYsT/SuU09XMS/pcv5Hec39PO9V+mgMlv7F/fMc08OVWPwUob/LEDPP4dtJbkbcO6TAhJbEnYEFoLeWLXndegpeW0OSHS7r2XvO5cJI9WcxXUKhWS9bBqw4EmdlDidgxTdhCPHV1HP6hxvQDuctQNdH8Twp1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=artgroup-spa.com;dmarc=pass action=none
 header.from=artgroup-spa.com;dkim=pass header.d=artgroup-spa.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=artgroupspa.onmicrosoft.com; s=selector2-artgroupspa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVtw2R7HWHW+6ju1QPn08JSJOzkYNxlfhwqA12EE1PM=;
 b=GoWrRygrdHpxBD5lmp6mNxexOnRDErkNBirWiBrxs7uksDI147PGNdeG0u5Awc6M3ZWiLCQ0Y5Jcx8lVZzdBJtZUOgqWFGPN2Hj+pgi7nwzAFJZREJstnap2UWErDYk1ZQ9o697W8Xj/1mUkBJbQolJCMaJjjCZgs6v7cl7HDZE=
Received: from AM5P192MB0180.EURP192.PROD.OUTLOOK.COM (10.175.13.20) by
 AM5P192MB0243.EURP192.PROD.OUTLOOK.COM (10.175.12.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Thu, 8 Aug 2019 00:09:47 +0000
Received: from AM5P192MB0180.EURP192.PROD.OUTLOOK.COM
 ([fe80::58f2:c38:e678:c9fc]) by AM5P192MB0180.EURP192.PROD.OUTLOOK.COM
 ([fe80::58f2:c38:e678:c9fc%11]) with mapi id 15.20.2136.018; Thu, 8 Aug 2019
 00:09:47 +0000
From: Giuliano Zannetti - ART S.p.A. <giuliano.zannetti@artgroup-spa.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: multi pcm plugin issue
Thread-Index: AdVNfYct6VbivcsLSZ+fdHgmt+XpuA==
Date: Thu, 8 Aug 2019 00:09:47 +0000
Message-ID: <AM5P192MB01809959F8AC046FAC258809C5D70@AM5P192MB0180.EURP192.PROD.OUTLOOK.COM>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=giuliano.zannetti@artgroup-spa.com; 
x-originating-ip: [94.37.176.55]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 416f78cc-24ff-435d-8377-08d71b94b980
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM5P192MB0243; 
x-ms-traffictypediagnostic: AM5P192MB0243:
x-microsoft-antispam-prvs: <AM5P192MB024366341484186D64060467C5D70@AM5P192MB0243.EURP192.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(346002)(376002)(39850400004)(199004)(189003)(7696005)(66066001)(5660300002)(14454004)(478600001)(6506007)(186003)(30864003)(81156014)(33656002)(74316002)(81166006)(8936002)(66556008)(2351001)(66446008)(64756008)(86362001)(9326002)(66946007)(66476007)(76116006)(6916009)(99286004)(52536014)(8676002)(476003)(3480700005)(102836004)(2906002)(19627235002)(256004)(14444005)(26005)(6116002)(25786009)(7736002)(5640700003)(2501003)(6436002)(6306002)(53946003)(316002)(53936002)(54896002)(55016002)(790700001)(71200400001)(71190400001)(3846002)(486006)(9686003)(569006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5P192MB0243;
 H:AM5P192MB0180.EURP192.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: artgroup-spa.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ccTknE8oG5DC7CBL9eWSeGBDD0wOF/XrkUHZo3x0XOHhdLus5elXn1AsQtsqiGmWHXcVSEyJa3fSv99Q1LvQ8uQX33r7f4QrnlQLOkjYXA4bVn8rlk3je/69KMI+ZZBq5p5ZRbnJhevnL3tvyV4zNKoXVLag9y5P+M2xjFnxob4FxTEJiLACL5A9gZ+KfCafY4oICnE9qOost5pMJhLsAvocbZixHo3d0KGjrNUnRne3LIKhw8aTrodn6a3MhAxSe8ZDNOpGFQ/rhp7MxM7nHrVRDt98czcwDATYvzx7kGGoT22UXmYL3/xjptSgduLgr68qS4qtQxnwkuZaH4QPZcZ576He1JKcQ0R918i1HtgEzDAWhl6UJO8kxepKlzDolCQi31FNuL6+4sQFEnFNLK8HJgZm0ism3YnGcMqUUaI=
MIME-Version: 1.0
X-OriginatorOrg: artgroup-spa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 416f78cc-24ff-435d-8377-08d71b94b980
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 00:09:47.6292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53c55efc-dafd-4709-9ce8-f76299277497
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: giuliano.zannetti@artgroup-spa.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5P192MB0243
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] multi pcm plugin issue
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

Hi,

I have a performance related problem using the multi PCM plugin.


---------------------------------------------------------------------
    THE ISSUE
---------------------------------------------------------------------

The following scenario triggers the issue. The CPU load is up to 90%.

plug - - > upmix - - > multi - - > forward_dmix
                             - - > loopback_dmix

pcm.giuliano_plug
{
  type plug
  slave.pcm giuliano_upmix
  slave.channels 2
}

pcm.giuliano_upmix
{
  type route
  slave.pcm giuliano_multi
  slave.channels 4
  ttable.0.0 1
  ttable.0.1 1
  ttable.1.2 1
  ttable.1.3 1
}

pcm.giuliano_multi
{
  type multi
  slaves
  {
    slave0
    {
      pcm forward_dmix
      channels 2
    }
    slave1
    {
      pcm loopback_dmix
      channels 2
    }
  }
  bindings
  {
    0 {slave slave0 channel 0}
    1 {slave slave0 channel 1}
    2 {slave slave1 channel 0}
    3 {slave slave1 channel 1}
  }
  master 0
}

pcm.forward_dmix
{
  type dmix
  ipc_key 1000
  ipc_key_add_uid 1
  ipc_perm 0600
  slave.period_time 10000
  slave.period_size 480
  slave.buffer_size 1920
  slave.rate 48000
  slave.pcm "hw:0,0"
}

pcm.loopback_dmix
{
  type dmix
  ipc_key 1001
  ipc_key_add_uid 1
  ipc_perm 0600
  slave.period_time 10000
  slave.period_size 480
  slave.buffer_size 1920
  slave.rate 48000
  slave.pcm loopback_out
}

pcm.loopback_out
{
  type hw
  card Loopback
  device 0
  subdevice 0
}

pcm.loopback_dsnoop
{
  type dsnoop
  ipc_key 1002
  ipc_key_add_uid 1
  ipc_perm 0600
  slave.period_time 10000
  slave.period_size 480
  slave.buffer_size 1920
  slave.rate 48000
  slave.pcm loopback_in
}

pcm.loopback_in
{
  type hw
  card Loopback
  device 1
  subdevice 0
}

The following scenario does not trigger the issue. The CPU load is at most 2%.

plug - - > upmix - - > downmix - - > forward_dmix

pcm.giuliano_plug
{
  type plug
  slave.pcm giuliano_upmix
  slave.channels 2
}

pcm.giuliano_upmix
{
  type route
  slave.pcm giuliano_downmix
  slave.channels 4
  ttable.0.0 1
  ttable.0.1 1
  ttable.1.2 1
  ttable.1.3 1
}

pcm.giuliano_downmix
{
  type route
  slave.pcm forward_dmix
  slave.channels 2
  ttable.0.0 1
  ttable.1.1 1
  ttable.2.0 1
  ttable.3.1 1
}


---------------------------------------------------------------------
    DEBUG PRINTS IN FUNCTION snd_pcm_write_areas IN FILE pcm.c
---------------------------------------------------------------------

For each while iteration the log prints the available frames (avail) and the frames
to be written (size). In the multi scenario the several while iterations decrease the
performances and the CPU load is high. In the normal scenario i see that at most two iterations
of the while are needed. In other words, in the multi scenario the avail frames are not enough
to stop the loop. You can see below the prints: avail < size for 28 iterations. Note that
this behaviour does not occurs only at startup, but every time during the playback.

snd_pcm_sframes_t snd_pcm_write_areas(snd_pcm_t *pcm, const snd_pcm_channel_area_t *areas,
                      snd_pcm_uframes_t offset, snd_pcm_uframes_t size,
                      snd_pcm_xfer_areas_func_t func)
{
    snd_pcm_uframes_t xfer = 0;
    snd_pcm_sframes_t err = 0;
    snd_pcm_state_t state;

    if (size == 0)
        return 0;

    int giuliano_i = 0;

    __snd_pcm_lock(pcm); /* forced lock */
    while (size > 0) {
        snd_pcm_uframes_t frames;
        snd_pcm_sframes_t avail;
    _again:
        state = __snd_pcm_state(pcm);
        switch (state) {
        case SND_PCM_STATE_PREPARED:
        case SND_PCM_STATE_PAUSED:
            break;
        case SND_PCM_STATE_RUNNING:
            err = __snd_pcm_hwsync(pcm);
            if (err < 0)
                goto _end;
            break;
        default:
            err = pcm_state_to_error(state);
            if (!err)
                err = -EBADFD;
            goto _end;
        }
        avail = __snd_pcm_avail_update(pcm);

        fprintf(
            stderr,
            "giuliano | pcm.c | snd_pcm_write_areas | (%d) avail=%ld, size=%ld\n",
            giuliano_i, avail, size
        );
        giuliano_i ++;

        if (avail < 0) {
            err = avail;
            goto _end;
        }
        if (state == SND_PCM_STATE_RUNNING &&
            size > (snd_pcm_uframes_t)avail) {
            if (snd_pcm_may_wait_for_avail_min(pcm, avail)) {
                if (pcm->mode & SND_PCM_NONBLOCK) {
                    err = -EAGAIN;
                    goto _end;
                }

                err = snd_pcm_wait_nocheck(pcm, -1);

                if (err < 0)
                    break;

                goto _again;
            }
            /* the snd_pcm_may_wait_for_avail_min may check against the
             * updated hw.ptr (slaves), get the avail again here
             */
            avail = __snd_pcm_avail_update(pcm);
            if (avail < 0) {
                err = avail;
                goto _end;
            }
        }
        frames = size;
        if (frames > (snd_pcm_uframes_t) avail)
            frames = avail;
        if (! frames)
            break;
        err = func(pcm, areas, offset, frames);
        if (err < 0)
            break;
        frames = err;
        if (state == SND_PCM_STATE_PREPARED) {
            snd_pcm_sframes_t hw_avail = pcm->buffer_size - avail;
            hw_avail += frames;
            /* some plugins might automatically start the stream */
            state = __snd_pcm_state(pcm);
            if (state == SND_PCM_STATE_PREPARED &&
                hw_avail >= (snd_pcm_sframes_t) pcm->start_threshold) {
                err = __snd_pcm_start(pcm);
                if (err < 0)
                    goto _end;
            }
        }
        offset += frames;
        size -= frames;
        xfer += frames;
    }
_end:
    __snd_pcm_unlock(pcm);
    return xfer > 0 ? (snd_pcm_sframes_t) xfer : snd_pcm_check_error(pcm, err);
}


---------------------------------------------------------------------
    DEBUG PRINTS OUTPUT
---------------------------------------------------------------------

## Multi scenario ##

giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=1920
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=1920
giuliano | pcm.c | snd_pcm_write_areas | (0) avail=1920, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=1440
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=1440
giuliano | pcm.c | snd_pcm_write_areas | (0) avail=1440, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=960
giuliano | pcm.c | snd_pcm_write_areas | (0) avail=960, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=480
giuliano | pcm.c | snd_pcm_write_areas | (0) avail=480, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=0
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
giuliano | pcm.c | snd_pcm_write_areas | (0) avail=0, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 0
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
giuliano | pcm.c | snd_pcm_write_areas | (1) avail=0, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 0
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
giuliano | pcm.c | snd_pcm_write_areas | (2) avail=0, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 0
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
giuliano | pcm.c | snd_pcm_write_areas | (3) avail=0, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 0
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
giuliano | pcm.c | snd_pcm_write_areas | (4) avail=0, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 0
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
giuliano | pcm.c | snd_pcm_write_areas | (5) avail=0, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 0
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
giuliano | pcm.c | snd_pcm_write_areas | (6) avail=0, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 0
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
giuliano | pcm.c | snd_pcm_write_areas | (7) avail=0, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 0
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
giuliano | pcm.c | snd_pcm_write_areas | (8) avail=0, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 0
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
giuliano | pcm.c | snd_pcm_write_areas | (9) avail=0, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 0
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
giuliano | pcm.c | snd_pcm_write_areas | (10) avail=0, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 0
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
giuliano | pcm.c | snd_pcm_write_areas | (11) avail=0, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 0
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
giuliano | pcm.c | snd_pcm_write_areas | (12) avail=0, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 0
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
giuliano | pcm.c | snd_pcm_write_areas | (13) avail=0, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 0
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
giuliano | pcm.c | snd_pcm_write_areas | (14) avail=0, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 0
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
giuliano | pcm.c | snd_pcm_write_areas | (15) avail=0, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=0
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 0
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
giuliano | pcm.c | snd_pcm_write_areas | (16) avail=384, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 384
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
giuliano | pcm.c | snd_pcm_write_areas | (17) avail=384, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 384
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
giuliano | pcm.c | snd_pcm_write_areas | (18) avail=384, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 384
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
giuliano | pcm.c | snd_pcm_write_areas | (19) avail=384, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 384
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
giuliano | pcm.c | snd_pcm_write_areas | (20) avail=384, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 384
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
giuliano | pcm.c | snd_pcm_write_areas | (21) avail=384, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 384
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
giuliano | pcm.c | snd_pcm_write_areas | (22) avail=384, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 384
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
giuliano | pcm.c | snd_pcm_write_areas | (23) avail=384, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 384
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
giuliano | pcm.c | snd_pcm_write_areas | (24) avail=384, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 384
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
giuliano | pcm.c | snd_pcm_write_areas | (25) avail=384, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 384
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
giuliano | pcm.c | snd_pcm_write_areas | (26) avail=384, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 384
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=384
giuliano | pcm.c | snd_pcm_write_areas | (27) avail=384, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=1440
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=576
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=1440
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=576
giuliano | pcm.c | snd_pcm_write_areas | (28) avail=576, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=96
giuliano | pcm.c | snd_pcm_write_areas | (0) avail=96, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=96
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 96
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=96
giuliano | pcm.c | snd_pcm_write_areas | (1) avail=96, size=480
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=0, avail=960
giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=1, avail=96
*** snd_pcm_wait() FATAL ERROR!!!
avail_min = 480, avail_update = 96

## Normal scenario ##

giuliano | pcm.c | snd_pcm_write_areas | (0) avail=1920, size=480
giuliano | pcm.c | snd_pcm_write_areas | (0) avail=1440, size=480
giuliano | pcm.c | snd_pcm_write_areas | (0) avail=960, size=480
giuliano | pcm.c | snd_pcm_write_areas | (0) avail=480, size=480
giuliano | pcm.c | snd_pcm_write_areas | (0) avail=0, size=480
giuliano | pcm.c | snd_pcm_write_areas | (1) avail=480, size=480
giuliano | pcm.c | snd_pcm_write_areas | (0) avail=0, size=480
giuliano | pcm.c | snd_pcm_write_areas | (1) avail=480, size=480
giuliano | pcm.c | snd_pcm_write_areas | (0) avail=0, size=480
giuliano | pcm.c | snd_pcm_write_areas | (1) avail=480, size=480
giuliano | pcm.c | snd_pcm_write_areas | (0) avail=0, size=480
giuliano | pcm.c | snd_pcm_write_areas | (1) avail=480, size=480
giuliano | pcm.c | snd_pcm_write_areas | (0) avail=0, size=480
giuliano | pcm.c | snd_pcm_write_areas | (1) avail=480, size=480
giuliano | pcm.c | snd_pcm_write_areas | (0) avail=0, size=480
giuliano | pcm.c | snd_pcm_write_areas | (1) avail=480, size=480
giuliano | pcm.c | snd_pcm_write_areas | (0) avail=0, size=480
giuliano | pcm.c | snd_pcm_write_areas | (1) avail=480, size=480
giuliano | pcm.c | snd_pcm_write_areas | (0) avail=0, size=480
giuliano | pcm.c | snd_pcm_write_areas | (1) avail=480, size=480
giuliano | pcm.c | snd_pcm_write_areas | (0) avail=0, size=480
giuliano | pcm.c | snd_pcm_write_areas | (1) avail=480, size=480


---------------------------------------------------------------------
    DEBUG PRINTS IN FUNCTION snd_pcm_wait_nocheck IN FILE pcm.c
---------------------------------------------------------------------

As you can see in the debug prints above i have enabled the error message
in the function snd_pcm_wait_nocheck.

That message lead me to think that the issue is a poll related one, may be?

int snd_pcm_wait_nocheck(snd_pcm_t *pcm, int timeout)
{
  struct pollfd *pfd;
  unsigned short revents = 0;
  int npfds, err, err_poll;

  npfds = __snd_pcm_poll_descriptors_count(pcm);
  if (npfds <= 0 || npfds >= 16) {
    SNDERR("Invalid poll_fds %d\n", npfds);
    return -EIO;
  }
  pfd = alloca(sizeof(*pfd) * npfds);
  err = __snd_pcm_poll_descriptors(pcm, pfd, npfds);
  if (err < 0)
    return err;
  if (err != npfds) {
    SNDMSG("invalid poll descriptors %d\n", err);
    return -EIO;
  }
  do {
    __snd_pcm_unlock(pcm);
    err_poll = poll(pfd, npfds, timeout);
    __snd_pcm_lock(pcm);
    if (err_poll < 0) {
            if (errno == EINTR && !PCMINABORT(pcm))
                    continue;
      return -errno;
                }
    if (! err_poll)
      break;
    err = __snd_pcm_poll_revents(pcm, pfd, npfds, &revents);
    if (err < 0)
      return err;
    if (revents & (POLLERR | POLLNVAL)) {
      /* check more precisely */
      err = pcm_state_to_error(__snd_pcm_state(pcm));
      return err < 0 ? err : -EIO;
    }
  } while (!(revents & (POLLIN | POLLOUT)));
#if 1 /* very useful code to test poll related problems */
  {
    snd_pcm_sframes_t avail_update;
    __snd_pcm_hwsync(pcm);
    avail_update = __snd_pcm_avail_update(pcm);
    if (avail_update < (snd_pcm_sframes_t)pcm->avail_min) {
      printf("*** snd_pcm_wait() FATAL ERROR!!!\n");
      printf("avail_min = %li, avail_update = %li\n", pcm->avail_min, avail_update);
    }
  }
#endif
  return err_poll > 0 ? 1 : 0;
}
#endif


---------------------------------------------------------------------
    DEBUG PRINTS IN FUNCTION __snd_pcm_avail_update IN pcm_multi.c
---------------------------------------------------------------------

As you can see in the prints above, i put some debugs logs in the function
__snd_pcm_avail_update. I can read there the number of avail frames for each slave of
the multi. I see also that the minimum numbers of frames is taken among the slaves.

static snd_pcm_sframes_t snd_pcm_multi_avail_update(snd_pcm_t *pcm)
{
  snd_pcm_multi_t *multi = pcm->private_data;
  snd_pcm_sframes_t ret = LONG_MAX;

    snd_pcm_sframes_t giuliano_temp = 0;

  unsigned int i;
  for (i = 0; i < multi->slaves_count; ++i) {
    snd_pcm_sframes_t avail;
    avail = snd_pcm_avail_update(multi->slaves[i].pcm);
        fprintf(
            stderr,
            "giuliano | pcm_multi.c | snd_pcm_multi_avail_update | slave=%d, avail=%d\n",
            i, avail
        );
    if (avail < 0)
      return avail;
    if (ret > avail)
      ret = avail;
  }
  snd_pcm_multi_hwptr_update(pcm);

    return ret;
}



I hope that my debug prints are useful to find the issue.



Thanks

Giuliano Zannetti
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
