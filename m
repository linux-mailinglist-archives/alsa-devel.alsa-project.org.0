Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9F31B27A0
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 15:24:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F03816C6;
	Tue, 21 Apr 2020 15:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F03816C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587475476;
	bh=rsZrUNlJNV5UjsCvkGmiHieNh5TCiyltFwvSHxksx+w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZKk1bzFGi/NLac/RkR5SbrfC/3Aa9VXer0poP2fyVi4bJy1eMAxqat+7hiB7tmDYC
	 wN0Jt4pAV6bbUSx2EtuSFv16Xaz0OkMRaW2uh9ZcqUc2dvBxbfzRn+cU847DPbwmou
	 5hwbZTM4vhxGuMetGt+3uM/8eqCnbgKoaq28sO+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 880AEF80143;
	Tue, 21 Apr 2020 15:22:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04774F801EC; Tue, 21 Apr 2020 15:22:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61078F8012F
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 15:22:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61078F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="JZac5bt4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587475367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3KBqXz8WrAqF7T0W/pKWQJ8uxdqxU5Ol/zSzWT7eAwU=;
 b=JZac5bt41pO0IfVSC5IxBT8dmhCw++NY8b3+Kq4JhToIyTJV/xWKeoMNdbLVObh7VdYP4M
 rqssmW08LQinz3UPI4JZSTWjrLI1eavbo9ovakkahu4e/HtFdh7GwBV5Q5ZWi6snCN+wr8
 jL6mRbsCrsVvtSQjRXVi6tRRIayEE2s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-HBfxCL9KNUm6Y3kGZPeSoA-1; Tue, 21 Apr 2020 09:22:45 -0400
X-MC-Unique: HBfxCL9KNUm6Y3kGZPeSoA-1
Received: by mail-wr1-f71.google.com with SMTP id d17so7450374wrr.17
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 06:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3KBqXz8WrAqF7T0W/pKWQJ8uxdqxU5Ol/zSzWT7eAwU=;
 b=RwLYJK4RI1Z4vUiLRK9Gzrky8o4cGzKec9Y+p4kNjPtcx3tmwGAgl+lmtBvbO6ozRD
 +IKZeJ+976ULdyKvQjCBe7XQCJgG1rLr5NHK2nnVV99RJIIH7Xxebt9sBaruu4ZtmywR
 xY4mOgn5SegssqH2VILwyIGgj8KgNoIxSQ3CVVxHr1TxyHg90JpfFZm9wMAhDcbv/0z3
 URXw3hbVC5HLqjNfWb3sjs9LS/bACAE3wq3QDYmUDtyn/3ia1Cfs/G2GO0/F4bBfxZm0
 OIN35KXEc+0zUL7NwG46chQiXPmEmZ0BklKKEmu6oN9IRUprd+7Mqs0/baAmK480fuXU
 OLUg==
X-Gm-Message-State: AGi0PuYMZd2lGu7x/9APBvgSA6wcSAFW2ITQDXJos0vppe2NHFbZ4/cx
 LjOHxElo3bJQY7Y0aseYCz41PW98qyh/ggBPXLkx4llBpwothUVnV/VNxSrA305f/SSaCluGJbg
 OppTfkys0+bOoNw1YtEW8QNk=
X-Received: by 2002:adf:dd83:: with SMTP id x3mr23865046wrl.298.1587475364352; 
 Tue, 21 Apr 2020 06:22:44 -0700 (PDT)
X-Google-Smtp-Source: APiQypKYhnIM49iXeHouYwqMNvOAmO3Cj9vaRuDFuwdRic79lnaotcsSHF38rhui+H9DdhslGwp9fQ==
X-Received: by 2002:adf:dd83:: with SMTP id x3mr23865026wrl.298.1587475364200; 
 Tue, 21 Apr 2020 06:22:44 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id h3sm3660781wrm.73.2020.04.21.06.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 06:22:43 -0700 (PDT)
Subject: Re: [PATCH 1/2] ASoC: SOF: Fix "no reply expected" error during
 firmware-boot
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200402184948.3014-1-hdegoede@redhat.com>
 <1ecf6c31-4eb1-0288-2353-7a7a421fe5e7@linux.intel.com>
 <a0d5d95e-113b-3543-cfc5-43dfa3f9142c@redhat.com>
 <be66d657-f4c5-46d8-d0b5-4879d7aa7463@linux.intel.com>
 <20200420124815.GB10045@sirena.org.uk>
 <84764e4c-8077-15b6-ff4c-9d002d42734a@linux.intel.com>
 <alpine.DEB.2.21.2004202320370.2957@eliteleevi.tm.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <ed11f532-432e-cc4c-160e-31b0ec427b82@redhat.com>
Date: Tue, 21 Apr 2020 15:22:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004202320370.2957@eliteleevi.tm.intel.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
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

Hi,

On 4/20/20 10:28 PM, Kai Vehmanen wrote:
> Hey,
> 
> On Mon, 20 Apr 2020, Pierre-Louis Bossart wrote:
> 
>>>> On 4/3/20 3:01 AM, Hans de Goede wrote:
>>>>> Unfortunately even with that patch cherry picked the errors my
>>>>> patch silences still happen.
>>
>> Sorry about the delay, on my side I don't see this anymore in my ApolloLake or
>> CML tests. Kai, can you confirm for HDaudio platforms?
> 
> I tested on a set of HDA platforms and I could not trigger the "no reply
> expected" errors. Tested with sof-dev (Mark's latest tree but staged SOF
> patches) that has the "ASoC: SOF: Intel: hda-loader: clear the IPC ack bit
> after FW_PURGE" patch.
> 
> If I revert this patch, the error trace comes back immediately, so this
> definitely helps to the trace spam at least in these cases.
> 
> There could of course be some relation to FW version. So if someone can
> still get the error trace, the FW version and platform used would be
> interesting information.

I've retested with 5.7-rc2 (previous testing was on 5.6-rc# + the
"ASoC: SOF: Intel: hda-loader: clear the IPC ack bit after FW_PURGE" patch)
and I'm no longer seeing this. So I guess fixing this also needed some other
patches which have now landed in 5.7.

So this is resolved now and my patch for this can be dropped.

Regards,

Hans

