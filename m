Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF5D7083D8
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 16:19:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E2096C0;
	Thu, 18 May 2023 16:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E2096C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684419590;
	bh=5HfDgJRuqBk5UBL2DhXrrZPbhlNr74K2Tzu+3ZS8fiw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=BvCzU57WwfkHJqg6fPP5U0FCJzunFtT3I9ed7OuIZErjsPjsz0EpfaOrfezYpCn2V
	 ESPmu3S3skWpIwX3xx9CdeEfIDpostfd+hZm6O1YOOnAweejC+K8O2DWUAKvG1ag3C
	 1Jyi+Ck/q9VHsdz3IgSOdOYK5p4bnzl5LH+NF4dA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCF9EF80542; Thu, 18 May 2023 16:18:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 433F4F8025A;
	Thu, 18 May 2023 16:18:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB106F80272; Thu, 18 May 2023 16:18:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5887AF8016A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 16:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5887AF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=WCaA9NiE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684419530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A2/iO6J14YtVUt4T4ndhV73ZmcEee58hQhg8A73F228=;
	b=WCaA9NiE0Ob/LFLPf9H9DMhqzSsaR0bZO/Nw1TAynJUh85RStZGipe8JjwP+OZlGutr6n8
	3pvPnyuRg45JPct7DnSrlXxLEPugCkDxpP7HKQwrcBDH3DkmwxRagvyY5XIqJ9e6tGrTBR
	32AXFLzXfL7mATAZx1G1rizLTAaYxDk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-roWwaH-VMYqBu_AbfgfC5A-1; Thu, 18 May 2023 10:18:48 -0400
X-MC-Unique: roWwaH-VMYqBu_AbfgfC5A-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6238d8b7fdcso8386506d6.0
        for <alsa-devel@alsa-project.org>;
 Thu, 18 May 2023 07:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684419528; x=1687011528;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A2/iO6J14YtVUt4T4ndhV73ZmcEee58hQhg8A73F228=;
        b=G5KxL5rsSwOy50ttNj2cDC2htHOCrPFGt9IqNMnbGd3vLniMCs1IJ0J8NrCtQEPy8b
         Cs+4std3WZqqViC0myVypmCR0Zjsr9PVyprawh1x+tyJv/SrqmQAdq0ruIWB0mMxH+R2
         BRFnOzpNY40k69IH5DjrvKxTVOPv4PjKKtnAlzsXx2b8GChmGhEVw/IBW6ziXCxqbeBH
         dyaff/hxsn0kDFtsV3QEyhIEgEGUg52Vqh86l5UP2kkUs1fkwD+/GoP44LjF3LlmX6Xa
         9MFsgJlCih7ASiAqJp2JuvbXd8fRAwpF1Gs/TDU1weitWWkiaN06Dth5Jox78hdIfZWl
         C8vg==
X-Gm-Message-State: AC+VfDxif0abwyoZMs1UDJMq0EblB2AMVNM+k7T8CPikM34IOlmOYkB1
	MWVQ7EKnhLUfSXkbS2wYqOWiSvUiIwxBG6OZU9iHefd65vz6tOWCQqepdzY11WumKMcyhJhe+Ai
	1x0sQg81uqEN+pr6L4u/DE7w=
X-Received: by 2002:a05:6214:f63:b0:619:c50b:8dc5 with SMTP id
 iy3-20020a0562140f6300b00619c50b8dc5mr6013301qvb.49.1684419528374;
        Thu, 18 May 2023 07:18:48 -0700 (PDT)
X-Google-Smtp-Source: 
 ACHHUZ4fXSC86dNxaLQPrCvmm9qJg09KGdf4/co2HJ+1zjym/VhIXeewvWIx/2AOsssmkoGiStYeIQ==
X-Received: by 2002:a05:6214:f63:b0:619:c50b:8dc5 with SMTP id
 iy3-20020a0562140f6300b00619c50b8dc5mr6013267qvb.49.1684419528073;
        Thu, 18 May 2023 07:18:48 -0700 (PDT)
Received: from [192.168.1.31] (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id
 s5-20020ad45245000000b00621066bde91sm553739qvq.52.2023.05.18.07.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 07:18:47 -0700 (PDT)
Message-ID: <822eda9c-6b1b-8c27-27ee-6f2855a261a5@redhat.com>
Date: Thu, 18 May 2023 07:18:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH] ALSA: emu10k1: set variables emu1010_routing_info and
 emu1010_pads_info storage-class-specifier to static
To: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20230518123826.925752-1-trix@redhat.com> <ZGYvG2Sf9ZeeOmL6@ugly>
From: Tom Rix <trix@redhat.com>
In-Reply-To: <ZGYvG2Sf9ZeeOmL6@ugly>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UT4MRX7N4FLGZGJGMVTKROIO6D6PRAHZ
X-Message-ID-Hash: UT4MRX7N4FLGZGJGMVTKROIO6D6PRAHZ
X-MailFrom: trix@redhat.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UT4MRX7N4FLGZGJGMVTKROIO6D6PRAHZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 5/18/23 6:58 AM, Oswald Buddenhagen wrote:
> On Thu, May 18, 2023 at 08:38:26AM -0400, Tom Rix wrote:
>> smatch reports
>  ^^^^^^ is this the best word to use here?

I have been running smatch against the whole tree for a while, using 
this preamble.

Many fixes later, for the most part the tree has been cleaned of this 
class of problems.

Tom

>
>> sound/pci/emu10k1/emumixer.c:519:39: warning: symbol
>>  'emu1010_routing_info' was not declared. Should it be static?
>> sound/pci/emu10k1/emumixer.c:859:36: warning: symbol
>>  'emu1010_pads_info' was not declared. Should it be static?
>>
>> These variables are only used in their defining file, so it should be 
>> static
>                               ^^ they
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
>>
> Reviewed-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
>
> (also amending one of the still pending patches. thanks!)
>
> regards
>

