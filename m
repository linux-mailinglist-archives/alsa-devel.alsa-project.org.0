Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D307417A77E
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 15:33:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A8011669;
	Thu,  5 Mar 2020 15:32:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A8011669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583418798;
	bh=FgCjp/IFtH26VDUzBGJATDgopI39zW5CZWEH2OUut/s=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=auZWfUb4Fwu723L+Jx/7yN7f8V+WETX+pJv/gjJV21vhy+fNVVNtm8kDIpqU1CcV+
	 OiH6QXACEKD6Ee6CTKrhTneYApIlGqFVqT97CdISgDs0VcCPQMaMZvrufpdwpLrcJ2
	 KQ3VaMTICQR6zkuqJzSpSUp+nWxay7Ht4WHYefUA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 945B6F80266;
	Thu,  5 Mar 2020 15:31:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B3EBF8025F; Thu,  5 Mar 2020 15:31:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF432F800D8
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 15:31:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF432F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Xmi0shJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583418691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3k8CRCvJdYRIZqM385IMhRJfgPuhoaTPrmjf/ABa7AI=;
 b=Xmi0shJ7qklKTtzB+1r7wNp0m665r60p4rAcp1gy30sI6Q3fwvI0Td1gciJo+RElBZxffV
 mxM/sjQzELKvKI8nEXceYXQvq1T5uTu8h5eDDBYKoRTzoTIx27+eFArPuAvLjea3RNM5Bn
 hPbVOBFSqKaMIrSQXpoLkd0opl8FEMg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-BJnIpxA-PEmuHwAV139NLw-1; Thu, 05 Mar 2020 09:31:30 -0500
X-MC-Unique: BJnIpxA-PEmuHwAV139NLw-1
Received: by mail-wr1-f71.google.com with SMTP id 72so2379689wrc.6
 for <alsa-devel@alsa-project.org>; Thu, 05 Mar 2020 06:31:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3k8CRCvJdYRIZqM385IMhRJfgPuhoaTPrmjf/ABa7AI=;
 b=XJ+YsPc67DYajq9C6vcBXg9q9WewU95cHDTrr5Ip1KQTOhd6fQdReyMT6BQr4oQ9nv
 Hd04afUTPhoIXb5ukch6Z1Uo8XiPCkwKw9t55ZE5uQOL7O4AlSYGuddB3NTp0mQ0FGHK
 Q2nC9uffpNL55PB+rppYB93F/IP0ubmB8tKHd/UwCzIzCVl+XhPe7huAx4EHqgLgcAIY
 5VM24QFLkgyW79xVJFvBRbBAs+qHPRqP1Wy520q7RL0XX+aKk1lNFBwseYtmwypHW/Xe
 +Z+VVarT0tHHGDiZiy007vyoB1z5heEOlNAU3b66lQB723XecAX2DLAIeT9w6Qzq71Tp
 Fc5w==
X-Gm-Message-State: ANhLgQ1lAaxVIWk7EzT0aqbxi39i3dWHK3Dt6fPYDjqKxRsKKFJ+yWR7
 Z1lKYtSgJu6fbGZ9vl7HQQp1gAt7XICwKyNfDidWrSHKlsx/n8jiBE9/+2qKm5N1KukfQ29nP1b
 3RE0t5nS8kXn/O/2bzVIAPzo=
X-Received: by 2002:adf:f18e:: with SMTP id h14mr10237555wro.51.1583418688917; 
 Thu, 05 Mar 2020 06:31:28 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsLV8O6Q/woF3SJLkyfks2VdnUUTo2GBc5r8ATzLbjcr4j16VyZRE/JBE1b/HLGbnNOmHo/dw==
X-Received: by 2002:adf:f18e:: with SMTP id h14mr10237539wro.51.1583418688701; 
 Thu, 05 Mar 2020 06:31:28 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id t187sm9903649wmt.25.2020.03.05.06.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2020 06:31:28 -0800 (PST)
Subject: Re: snd_hda_intel.power_save=1 causes pops/clicks on Lenovo T470s
 headphone jack?
From: Hans de Goede <hdegoede@redhat.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
References: <9d23ce16-1333-abd8-1941-e4a58069677d@redhat.com>
Message-ID: <81472a44-2134-ff16-666d-6e5e8d574173@redhat.com>
Date: Thu, 5 Mar 2020 15:31:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9d23ce16-1333-abd8-1941-e4a58069677d@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 3/5/20 3:29 PM, Hans de Goede wrote:
> Hi,
> 
> Because of a bug-report about power-saving related plops/clocks on a
> Lenovo T470s, I've asked inside Red Hat if people with a T470s and
> running a recent kernel were also experiencing this.
> 
> Most people are happy with the audio, but I did get a few bug reports
> about plops on the headphones-jack.
> 
> Is this a know issue? and/or is there anything we can do about this?

p.s.

One important thing which I forgot to mention, when using headphones
the plops are mostly deemed as acceptable. They become a real problem
when using the headphone jack to connect to an external amplifier,
then the plops are amplified by the external amplifier and they
become a real problem.

Regards,

Hans

