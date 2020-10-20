Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E995B294DC4
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 15:42:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A3511766;
	Wed, 21 Oct 2020 15:41:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A3511766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603287764;
	bh=F6WcrlIgyGs45kWYBhfyN5RU9yxwGy8XY7mqdbUyvlc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IubfRaEMSDs0nX6baFmVHYlzZ+5bv2pgKhhbS5V8oVL20o6U4bTeQrPsZBTAIyj7p
	 U0XRGujJDHeQS3UajdyfY3zuMsZJvjgPuzcxUAIeyJrkjRyNwhAKD3iBI4VqzhEqg6
	 p/M9ncO00LnnDKrRPw3QXQrz65IeZoaALsucGVe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E3D6F804F3;
	Wed, 21 Oct 2020 15:37:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BCF6F801F2; Tue, 20 Oct 2020 15:56:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E01A2F8011E
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 15:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E01A2F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="dqj1hqYp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603202165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HyQ28xr5/lapv6azTtFCvHFT5XQ1+OzeHk+84iEm66Y=;
 b=dqj1hqYpU6/y2h8V+kIQptv0xhdOCg30nYjG0UuQPR4HzPGpwcXs8bTMbLhH/MZ4iyaOGe
 bIsQLktd/HxsejJ6iD6T7AP53V0El8WD9AX/eQ5RKofX+tIH76o2/BtELPXTXNDVWD5wEg
 LuY4RW3ZSsnbV2leAXQmqfUp5Xe8+Ec=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-7YuG3-eSORu_cUA7qZOzRg-1; Tue, 20 Oct 2020 09:56:01 -0400
X-MC-Unique: 7YuG3-eSORu_cUA7qZOzRg-1
Received: by mail-qv1-f71.google.com with SMTP id z9so1420472qvo.20
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 06:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=HyQ28xr5/lapv6azTtFCvHFT5XQ1+OzeHk+84iEm66Y=;
 b=XzDX98soc1YSrkiFyAVV9ApQMZ5aqQA9tMQu7AyyGVA0uxdTOJC/+LnZkL2YKhj9Zv
 kTOJ+wpttscfQ5W5xD/4IsHf9eceEXUF2w7UKFEbWTbO39tIEq35A3ugsnhPIXBjvOvJ
 qU0RoBXpQRmueNpYanCN4y5j2CsNwN6mwwH7yrIzY8wKhazivT6fF0DwCbEM3SzDBK2U
 aYQ66UZFcGfliliVvgvvVxxuFFolY4CEbUbhyR3IuM6snH3uGh2079sR4IKxu0XOWC26
 DEOd4IRPej3w0AkvL+gey6UBTAYLpaNLFfEPzoUkE0pYSXvV9Hzdv/7HEtsScfiBuJSX
 8d9w==
X-Gm-Message-State: AOAM530t8tatLO+AKPi3VhCC3+llVpxGjeN+nNUig10qGBpk7ceMAFsE
 xuE7+3RbkN9hKYyKHT5X7wYnEtGCA2wpaXDVM1IXWdct+3EdPp+U+BL1vhghXkzlgQvPlUVzeQy
 P5GhFKea8lmrv/rQZSWn0U2c=
X-Received: by 2002:a05:6214:174f:: with SMTP id
 dc15mr3370459qvb.25.1603202160691; 
 Tue, 20 Oct 2020 06:56:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLUAfqrAOJzxwKF3+voCBF5yQYNbMOvfOkDZhumkJj3bEnT15V4x8vUJ5iQ5pWt9KusIZtsQ==
X-Received: by 2002:a05:6214:174f:: with SMTP id
 dc15mr3370377qvb.25.1603202160139; 
 Tue, 20 Oct 2020 06:56:00 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id b8sm775938qkn.133.2020.10.20.06.55.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2020 06:55:59 -0700 (PDT)
Subject: Re: [RFC] treewide: cleanup unreachable breaks
To: Nick Desaulniers <ndesaulniers@google.com>
References: <20201017160928.12698-1-trix@redhat.com>
 <20201018054332.GB593954@kroah.com>
 <CAKwvOdkR_Ttfo7_JKUiZFVqr=Uh=4b05KCPCSuzwk=zaWtA2_Q@mail.gmail.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <ca1f50d6-1005-8e3d-8d5c-98c82a704338@redhat.com>
Date: Tue, 20 Oct 2020 06:55:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOdkR_Ttfo7_JKUiZFVqr=Uh=4b05KCPCSuzwk=zaWtA2_Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Wed, 21 Oct 2020 15:37:33 +0200
Cc: alsa-devel@alsa-project.org,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, storagedev@microchip.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, ath10k@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, usb-storage@lists.one-eyed-alien.net,
 linux-watchdog@vger.kernel.org, devel@driverdev.osuosl.org,
 linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, linux-acpi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, industrypack-devel@lists.sourceforge.net,
 linux-pci@vger.kernel.org, spice-devel@lists.freedesktop.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-nfc@lists.01.org, linux-pm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-amlogic@lists.infradead.org, openipmi-developer@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org, linux-integrity@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 George Burgess <gbiv@google.com>, Network Development <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-security-module@vger.kernel.org,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, patches@opensource.cirrus.com,
 Joe Perches <joe@perches.com>, bpf <bpf@vger.kernel.org>,
 ocfs2-devel@oss.oracle.com, linux-power@fi.rohmeurope.com
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


On 10/19/20 12:42 PM, Nick Desaulniers wrote:
> On Sat, Oct 17, 2020 at 10:43 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>> On Sat, Oct 17, 2020 at 09:09:28AM -0700, trix@redhat.com wrote:
>>> From: Tom Rix <trix@redhat.com>
>>>
>>> This is a upcoming change to clean up a new warning treewide.
>>> I am wondering if the change could be one mega patch (see below) or
>>> normal patch per file about 100 patches or somewhere half way by collecting
>>> early acks.
>> Please break it up into one-patch-per-subsystem, like normal, and get it
>> merged that way.
>>
>> Sending us a patch, without even a diffstat to review, isn't going to
>> get you very far...
> Tom,
> If you're able to automate this cleanup, I suggest checking in a
> script that can be run on a directory.  Then for each subsystem you
> can say in your commit "I ran scripts/fix_whatever.py on this subdir."
>  Then others can help you drive the tree wide cleanup.  Then we can
> enable -Wunreachable-code-break either by default, or W=2 right now
> might be a good idea.

I should have waited for Joe Perches's fixer addition to checkpatch :)

The easy fixes I did only cover about 1/2 of the problems.

Remaining are mostly nested switches, which from a complexity standpoint is bad.

>
> Ah, George (gbiv@, cc'ed), did an analysis recently of
> `-Wunreachable-code-loop-increment`, `-Wunreachable-code-break`, and
> `-Wunreachable-code-return` for Android userspace.  From the review:
> ```
> Spoilers: of these, it seems useful to turn on
> -Wunreachable-code-loop-increment and -Wunreachable-code-return by
> default for Android

In my simple add-a-cflag bot, i see there are about 250

issues for -Wunreachable-code-return.

I'll see about doing this one next.

> ...
> While these conventions about always having break arguably became
> obsolete when we enabled -Wfallthrough, my sample turned up zero
> potential bugs caught by this warning, and we'd need to put a lot of
> effort into getting a clean tree. So this warning doesn't seem to be
> worth it.
> ```
> Looks like there's an order of magnitude of `-Wunreachable-code-break`
> than the other two.
>
> We probably should add all 3 to W=2 builds (wrapped in cc-option).
> I've filed https://github.com/ClangBuiltLinux/linux/issues/1180 to
> follow up on.

Yes, i think think these should be added.

Tom

