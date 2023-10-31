Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE187DCF55
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Oct 2023 15:39:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A52321D7;
	Tue, 31 Oct 2023 15:38:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A52321D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698763185;
	bh=Heu5B0ouJfUgyAv8c0kNwVvNEy2Xuun9jetzGvCWPfY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ncg6mXd2QBblIral7uNpKuy74tKXHM9a5t+nPwM9mrm+k13X6mrIvSckdhuLhzzJU
	 X5SxbFZi17Xhba2eP3kO8HwixHYgvB1X4nerzEOkpWDQK6+AbYyuKFD2KsRdhSl+21
	 X4d1hyUAcgOPZbjLw87b3eiebRNh69VQjpW92Y7U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77FAEF80494; Tue, 31 Oct 2023 15:38:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B6E7F8016D;
	Tue, 31 Oct 2023 15:38:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC9A8F8020D; Tue, 31 Oct 2023 15:38:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D87DF80152
	for <alsa-devel@alsa-project.org>; Tue, 31 Oct 2023 15:38:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D87DF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=dlInY780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698763093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eeN9ZUlabdXATGdNInIORWbDKAAKGs3kL6CMXOdEJFM=;
	b=dlInY780PhvxKJhqM+GA/QrxyG6L2vTwmw0tRvJAdq8zklOQYAp1U4nclgVjqOaadZkwQ2
	H5ExgFE5a9i3P/jVj1u54Xgqv2xJ5ldqhx6z8bV9oLHsmwZzp/Z70pdbdYXZazNe6iSe8F
	ek2MZhcx4mmjWwbGKF8F4+FJDuW+xnc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-uxj4BRiPNmyK9e-p6K12xg-1; Tue, 31 Oct 2023 10:38:07 -0400
X-MC-Unique: uxj4BRiPNmyK9e-p6K12xg-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-540150414efso4338157a12.3
        for <alsa-devel@alsa-project.org>;
 Tue, 31 Oct 2023 07:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698763085; x=1699367885;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eeN9ZUlabdXATGdNInIORWbDKAAKGs3kL6CMXOdEJFM=;
        b=JRdb1hPf/PwpVAsOrPpt/ffbRj49SPQHycqbx6mBWPVuUGmMjcEjmag/AdTz/hMHTv
         Zq81UC/WeSq5uKUgpKB42rCdTAR9Qyq0fLDsNx9TXM9BNw72aiB8gTN9b7o3AWw+kULt
         G9VOnpevkZ2KinLiQpyvAbgpWK4WarFzBxZO86WzY5SXtnRGI6p4vjVLdmVmXTxhjfq1
         g5gjkPXuF4duC6ICNfdK2w4N4bCb/HSXQHLOBtTKpJ8IUB3QCMAYaOJOHeNz2jxYcbTU
         pF7dtmm2z5UIMs/SJzaeQC5ytzzD8fqwn/u87ENAFYXtXln/eIaQptfKZ2zIKhuE1Zyk
         ZuJg==
X-Gm-Message-State: AOJu0YxQCM+zIjekQtIPh3ac6zl2rx9raq98ByFHvhKo0zf1WzSaC2Od
	08rSWeXxwPD14FgG8R0CAT2n8LTvSdJYEMF9krjoEj40Oxc18pzN5FDJjdxf+gnp4T8syqG/ITi
	RANg1DQa8hJ9YxZ4CQbXxxPs=
X-Received: by 2002:a50:c35b:0:b0:543:65ab:2f09 with SMTP id
 q27-20020a50c35b000000b0054365ab2f09mr1835102edb.34.1698763085300;
        Tue, 31 Oct 2023 07:38:05 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IFAMYktZwPZ6OdRZm8Cg++Yfmw17PmaydIlB8mcdKQ085txt7Hv2U8M7I8LsD+4U4QW0N1VAg==
X-Received: by 2002:a50:c35b:0:b0:543:65ab:2f09 with SMTP id
 q27-20020a50c35b000000b0054365ab2f09mr1835089edb.34.1698763085027;
        Tue, 31 Oct 2023 07:38:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029?
 (2001-1c00-2a07-3a01-06c4-9fb2-0fbc-7029.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029])
        by smtp.gmail.com with ESMTPSA id
 d10-20020aa7d5ca000000b0053db0df6970sm1234357eds.54.2023.10.31.07.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Oct 2023 07:38:04 -0700 (PDT)
Message-ID: <f737827e-acf6-43ca-b5a0-3bd06b19287e@redhat.com>
Date: Tue, 31 Oct 2023 15:38:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH alsa-ucm-conf] codecs/es8316: Fix mono speaker settings
 from previous boot getting applied
To: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>, alsa-devel@alsa-project.org
References: <20231029145007.24106-1-hdegoede@redhat.com>
 <9cc465aa-fc55-1880-a649-6c13e6005be8@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <9cc465aa-fc55-1880-a649-6c13e6005be8@perex.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: POQHJ4TFEQYUSDP2TTCAA7RTQCPBHIXF
X-Message-ID-Hash: POQHJ4TFEQYUSDP2TTCAA7RTQCPBHIXF
X-MailFrom: hdegoede@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/POQHJ4TFEQYUSDP2TTCAA7RTQCPBHIXF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Jaroslav,

On 10/31/23 15:12, Jaroslav Kysela wrote:
> On 29. 10. 23 15:50, Hans de Goede wrote:
>> When codecs/es8316/MonoSpeaker.conf's EnableSeq was run last before
>> shutdown the 'Playback Polarity' and 'DAC Mono Mix Switch' controls for
>> Mono Speaker output get saved and restored on the next boot.
>>
>> These settings are undone by the MonoSpeaker DisableSeq, but that never
>> runs when an updated kernel switches from the default "cfg-spk:1" in
>> components to "cfg-spk:2" for devices which do actually have 2 speakers,
>> which causes the ucm profile to use codecs/es8316/Speaker.conf instead.
>>
>> Set the 'Playback Polarity' and 'DAC Mono Mix Switch' controls to their
>> defaults in codecs/es8316/EnableSeq.conf to avoid them getting stuck
>> in Mono mix mode in this scenario.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   ucm2/codecs/es8316/EnableSeq.conf | 4 ++++
>>   1 file changed, 4 insertions(+)
> 
> Thanks. Applied.

Thank you.

Did you see my other 3 ucm-conf patches? :

https://lore.kernel.org/alsa-devel/20231021143109.52210-1-hdegoede@redhat.com/
https://lore.kernel.org/alsa-devel/20231021211614.115152-1-hdegoede@redhat.com/
https://lore.kernel.org/alsa-devel/20231021211614.115152-2-hdegoede@redhat.com/

Regards,

Hans

