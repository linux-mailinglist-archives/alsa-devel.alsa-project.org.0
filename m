Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 694BA296F9A
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Oct 2020 14:46:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E165D1828;
	Fri, 23 Oct 2020 14:45:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E165D1828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603457167;
	bh=fK1PVP2/FF2b02vdhMZHu/8DHk70MQrA1Cp9T1pEHek=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PzHz/MpbHsgVFz+x08masfeLHZXCL17JmezIPKt6KpIpX3CEaYHOmdV5506g93idX
	 2fbemR20dP0j6paYccbOG1PvanoYwROF0/1qfhE25VP/cs6WR5ioMbIBqZuXAyaZy2
	 XDDs3l2XWofR/4MoT7zWk0GH20+LdhqpZsLrf5y8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F97EF800BD;
	Fri, 23 Oct 2020 14:44:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6A40F8025A; Fri, 23 Oct 2020 14:44:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA7DFF800BD
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 14:44:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA7DFF800BD
Received: from mail-pl1-f198.google.com ([209.85.214.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kVwQj-0002RB-Gq
 for alsa-devel@alsa-project.org; Fri, 23 Oct 2020 12:44:25 +0000
Received: by mail-pl1-f198.google.com with SMTP id q4so1145943plr.11
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 05:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ss/2egyBfIZAiVE1IR9ul+5JtgcnBAIRvrLL4JsLF5Q=;
 b=EGmtHXCOKgw83IMs0EjsW2ST7bMfyjgHedyqPkyH2Bxu70ryIbixyclbeERW2qjp3x
 FM5rZO4N9mXcXVcrbUZV1PaUK7vSeQsPJrHU02jbUGxVTQz++mFf0HNCzk3Nal8zz/wc
 Zf5qqt2zeSu1jXVHPuPJkNoDKtJhoniR3VCHWu71nANpQ8WAyQLHctSHhIEPw6bui0jk
 RzQi1FCzBCMx1PatoX6BpWqW74l877NYR+6hitW+NxBmEcJvDNxfJFW9Kp46e9docfcP
 +vONWxv6GXAddURa3NiRUEpAH6joacQTJH+oBxvPxA/jqsnin+SiFwHQA4nzV4NUAOhT
 fh6g==
X-Gm-Message-State: AOAM532EVmtTCgHuBCqmIFWXZAwNj9J3CblPA0PeQar+hG9UDHw3DNvw
 L9vpc7+qpP+EidaldLfqXme8WtfnSFPvidnWJs2ZQZfLOCR/dNKaK2JoTBSdQismJCvthV4SULZ
 qh1h1VoeW8T6q5m9/v0sXNcsMgPn9aBfHr5PERk4U
X-Received: by 2002:a17:90a:1596:: with SMTP id
 m22mr2330758pja.189.1603457064106; 
 Fri, 23 Oct 2020 05:44:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6WrdLJEpNg0KYKwPikTKprEryePQjp/3SPSByjnLdoLTieJcrcAUKrt7vXluOMlPGu0y8rg==
X-Received: by 2002:a17:90a:1596:: with SMTP id
 m22mr2330726pja.189.1603457063688; 
 Fri, 23 Oct 2020 05:44:23 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id js21sm2572456pjb.14.2020.10.23.05.44.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2020 05:44:22 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH 1/4] ALSA: hda: Refactor codec PM to use direct-complete
 optimization
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <s5hk0vh89fv.wl-tiwai@suse.de>
Date: Fri, 23 Oct 2020 20:44:18 +0800
Content-Transfer-Encoding: 7bit
Message-Id: <9D7D9C4C-3245-41A3-B0C4-D74FBB5FE91A@canonical.com>
References: <20201023102340.25494-1-kai.heng.feng@canonical.com>
 <s5hk0vh89fv.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Harsha Priya <harshapriya.n@intel.com>,
 open list <linux-kernel@vger.kernel.org>, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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



> On Oct 23, 2020, at 19:32, Takashi Iwai <tiwai@suse.de> wrote:
> 
> On Fri, 23 Oct 2020 12:23:35 +0200,
> Kai-Heng Feng wrote:
>> 
>> +static void hda_codec_pm_complete(struct device *dev)
>> {
>> 	struct hda_codec *codec = dev_to_hda_codec(dev);
>> -	int ret;
>> 
>> -	ret = pm_runtime_force_resume(dev);
>> -	/* schedule jackpoll work for jack detection update */
>> -	if (codec->jackpoll_interval ||
>> -	    (pm_runtime_suspended(dev) && hda_codec_need_resume(codec)))
>> -		schedule_delayed_work(&codec->jackpoll_work,
>> -				      codec->jackpoll_interval);
>> -	return ret;
>> +	if (pm_runtime_suspended(dev) &&
>> +	    (hda_codec_need_resume(codec) || codec->forced_resume))
>> +		pm_request_resume(dev);
> 
> You shouldn't drop the check of codec->jackpoll_interval.  If this
> field is set, the codec driver has to resume no matter what it was, so
> that the polling can start up again.

Ok, will address in v2.

Kai-Heng

> 
> 
> thanks,
> 
> Takashi

