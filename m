Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A40294F7A
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 17:05:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACD491779;
	Wed, 21 Oct 2020 17:04:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACD491779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603292707;
	bh=iV6uzsCsdk+6ZYA2f/qUdLPzLerX/LoR11Vel5HzXsw=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lPbqoKCvfmbLT5EZWW77WtaJlpr1h87SXbQ9pxxit5Sp97okPmIWNbTVmcoSZiQEV
	 Jg2mMxWxxmkHYkJ+lOXhZWk2E7khRMOIDl/r9INNbCCUaJQHqPEPi/qErUyKRcXVh7
	 1z3TgXu2u+EJUiB9cUQgv2105c9VJ7a6YmbVUicA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 674EEF8011C;
	Wed, 21 Oct 2020 17:03:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9386F80264; Wed, 21 Oct 2020 17:03:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 830DFF80247
 for <alsa-devel@alsa-project.org>; Wed, 21 Oct 2020 17:03:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 830DFF80247
Received: from [222.130.135.198] (helo=[192.168.0.104])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1kVFe3-0008F3-UT; Wed, 21 Oct 2020 15:03:20 +0000
Subject: Re: [bug report] ALSA: hda - Don't register a cb func if it is
 registered already
From: Hui Wang <hui.wang@canonical.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20201021121904.GA1126544@mwanda>
 <da806361-d1a8-ce20-462f-0ec6acff5bfc@canonical.com>
Message-ID: <9be5bc31-0118-1542-560f-cfe2cecf2403@canonical.com>
Date: Wed, 21 Oct 2020 23:03:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <da806361-d1a8-ce20-462f-0ec6acff5bfc@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
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

Looks like this will not bring problem on patch_sigmatel.c, NULL and 
valid kernel pointer are same for IS_ERR(), they will not make IS_ERR() 
come true.

On 10/21/20 10:21 PM, Hui Wang wrote:
>
> On 10/21/20 8:19 PM, Dan Carpenter wrote:
>> Hello Hui Wang,
>>
>> The patch f4794c6064a8: "ALSA: hda - Don't register a cb func if it
>> is registered already" from Sep 30, 2020, leads to the following
>> static checker warning:
>>
>>     sound/pci/hda/patch_sigmatel.c:3075 stac92hd71bxx_fixup_hp_m4()
>>     warn: 'jack' can also be NULL
>>
>> sound/pci/hda/patch_sigmatel.c
>>    3069          /* Enable VREF power saving on GPIO1 detect */
>>    3070          snd_hda_codec_write_cache(codec, codec->core.afg, 0,
>>    3071 AC_VERB_SET_GPIO_UNSOLICITED_RSP_MASK, 0x02);
>>    3072          jack = snd_hda_jack_detect_enable_callback(codec, 
>> codec->core.afg,
>>    3073 stac_vref_event);
>>
>> Originally snd_hda_jack_detect_enable_callback() would not return NULL
>> here.
>>
>>    3074          if (!IS_ERR(jack))
>>    3075                  jack->private_data = 0x02;
>>    3076
>>    3077          spec->gpio_mask |= 0x02;
>>
>> But now we have this:
>>
>> sound/pci/hda/hda_jack.c
>>     301  struct hda_jack_callback *
>>     302  snd_hda_jack_detect_enable_callback_mst(struct hda_codec 
>> *codec, hda_nid_t nid,
>>     303                                          int dev_id, 
>> hda_jack_callback_fn func)
>>     304  {
>>     305          struct hda_jack_tbl *jack;
>>     306          struct hda_jack_callback *callback = NULL;
>>     307          int err;
>>     308
>>     309          jack = snd_hda_jack_tbl_new(codec, nid, dev_id);
>>     310          if (!jack)
>>     311                  return ERR_PTR(-ENOMEM);
>>     312          if (func && !func_is_already_in_callback_list(jack, 
>> func)) {
>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> We only allocate callback if there isn't one already.
> Yes, indeed, this is a problem.
>>
>>     313                  callback = kzalloc(sizeof(*callback), 
>> GFP_KERNEL);
>>     314                  if (!callback)
>>     315                          return ERR_PTR(-ENOMEM);
>>     316                  callback->func = func;
>>     317                  callback->nid = jack->nid;
>>     318                  callback->dev_id = jack->dev_id;
>>     319                  callback->next = jack->callback;
>>     320                  jack->callback = callback;
>>     321          }
>>     322
>>     323          if (jack->jack_detect)
>>     324                  return callback; /* already registered */
>>                          ^^^^^^^^^^^^^^^
>> So presumably this should be jack->callback
>
> Looks like it is also not correct to return the jack->callback.  Need 
> to take some time to write a fix for it.
>
>
> Thanks for reporting the issue.
>
>>
>>
>>     325          jack->jack_detect = 1;
>>     326          if (codec->jackpoll_interval > 0)
>>     327                  return callback; /* No unsol if we're 
>> polling instead */
>>                          ^^^^^^^^^^^^^^^^
>>
>>     328          err = snd_hda_codec_write_cache(codec, nid, 0,
>>     329 AC_VERB_SET_UNSOLICITED_ENABLE,
>>     330                                           AC_USRSP_EN | 
>> jack->tag);
>>     331          if (err < 0)
>>     332                  return ERR_PTR(err);
>>     333          return callback;
>>                  ^^^^^^^^^^^^^^^^
>> And these as well.
>>
>>     334  }
>>
>> regards,
>> dan carpenter
