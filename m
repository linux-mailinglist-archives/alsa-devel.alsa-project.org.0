Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAD87D950E
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 12:19:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7797AE8;
	Fri, 27 Oct 2023 12:18:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7797AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698401956;
	bh=jZY15p4oIEfxgWyNWClalrKHx1YMgCfc6TjxYt8iXs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HRLQedWBBVaywRBWEnIwkJt/Xu5G+kbb1rgP1k7RRxg1LOwg0bnT6Rvv24kQlQGjG
	 ouDqi0IL5pIS904IT/yD8jQPnju3KYeP5O9oL5d8oPBORTmQPjUhal1CfpYfOxU2nJ
	 CqzUOnSMH8X+elWtFrf2qzu2hNMRdYsMUlYxjrHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0457FF80224; Fri, 27 Oct 2023 12:18:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D45FF80165;
	Fri, 27 Oct 2023 12:18:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2933FF8019B; Fri, 27 Oct 2023 12:18:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40401F8012B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 12:18:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40401F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=S6gDp5uC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698401891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jZY15p4oIEfxgWyNWClalrKHx1YMgCfc6TjxYt8iXs0=;
	b=S6gDp5uCMmgW5NZHSAi2sWe6lVerJ0ucK7psH/5I02TbJFTQe4QhbcR+CxCfeI6y4M8crd
	48ohPMkM0aNrteLq70hSZefOOcfNirZqQmlqtVskP8GpZiWpii4PjMrGGqqS6/zDr9K1QU
	sDsnoRZe84CFMXpv1b7LiMYaFgQajl4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-e6kDCCCnNMuompSrVFkByw-1; Fri, 27 Oct 2023 06:18:10 -0400
X-MC-Unique: e6kDCCCnNMuompSrVFkByw-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-778a20a16e3so270261785a.2
        for <alsa-devel@alsa-project.org>;
 Fri, 27 Oct 2023 03:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698401889; x=1699006689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZY15p4oIEfxgWyNWClalrKHx1YMgCfc6TjxYt8iXs0=;
        b=nRUnP3DxFAzCnIHa59xT+uZtpZEOgyaw6PeqoglJh9iFyjAISI774uDh3DO9pAix5w
         c4aAWqCfq8t2BYdehcecz1bLZZYY53uEL8eiurz6ZjnQZ8G8h2bDiWzb30F1wucx4GiN
         FGY8kHUBTSHykUyzOCGVdVgWBce5EuXB664mk8gaCnjGBLPNVscloHUv28trlaScgBMN
         Ra1IB66m7PpO472z9V2OOEvU0RFV7Cc4JGk/Cn4EXuKQHpYfitVAKwgU1x+rvgLzYYIR
         6WCEect92dsP9W2lkb1wY1fJIOdWi3bDfYlyaO4OrQSTFN8Dh/gh51AbctsU+k4cgUyE
         Y1sQ==
X-Gm-Message-State: AOJu0Yz0yrFasaNaU+W7K4tC1X8+23itX4hqMdA/ZncgSLo1VR0nSnWK
	beKa+ReiJ55GLQOuTPSngg5aCwG5USDWiPflwbNxopgozCOMxhKd+o5AxkJkstwT77MrZvFiUdx
	DD5CNM/tuHtxbhTTMBVta9vE=
X-Received: by 2002:a37:c247:0:b0:774:15ad:f34c with SMTP id
 j7-20020a37c247000000b0077415adf34cmr1906266qkm.70.1698401889396;
        Fri, 27 Oct 2023 03:18:09 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IEVbi3m4HtBsaAHCYuS1Gm+WqONcRY/f91+9J5q+xtfN+RS9/bPp7pN8qw6/VJVCiFy4pQCMw==
X-Received: by 2002:a37:c247:0:b0:774:15ad:f34c with SMTP id
 j7-20020a37c247000000b0077415adf34cmr1906237qkm.70.1698401888896;
        Fri, 27 Oct 2023 03:18:08 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-185-56.business.telecomitalia.it.
 [87.12.185.56])
        by smtp.gmail.com with ESMTPSA id
 y3-20020a37e303000000b00774830b40d4sm420637qki.47.2023.10.27.03.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 03:18:08 -0700 (PDT)
Date: Fri, 27 Oct 2023 12:18:00 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Takashi Iwai <tiwai@suse.de>, mst@redhat.com
Cc: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	anton.yakovlev@opensynergy.com, mst@redhat.com, perex@perex.cz,
 tiwai@suse.com,
	virtualization@lists.linux-foundation.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
	pbonzini@redhat.com, stefanha@redhat.com, manos.pitsidianakis@linaro.org,
	mripard@redhat.com
Subject: Re: [PATCH v4] ALSA: virtio: use ack callback
Message-ID: <jmuevryxo2nlqriqbwz6y2ttwzxwajfsnb5vaez2oqu7etkrd3@lu3pgnfushmr>
References: <ZTjkn1YAFz67yfqx@fedora>
 <87cyx0xvn7.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <87cyx0xvn7.wl-tiwai@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Message-ID-Hash: YZ3L2KYTD2BQOSBYUK22GZFPBKIWRY7N
X-Message-ID-Hash: YZ3L2KYTD2BQOSBYUK22GZFPBKIWRY7N
X-MailFrom: sgarzare@redhat.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YZ3L2KYTD2BQOSBYUK22GZFPBKIWRY7N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Oct 27, 2023 at 11:27:40AM +0200, Takashi Iwai wrote:
>On Wed, 25 Oct 2023 11:49:19 +0200,
>Matias Ezequiel Vara Larsen wrote:
>>
>> This commit uses the ack() callback to determine when a buffer has been
>> updated, then exposes it to guest.
>>
>> The current mechanism splits a dma buffer into descriptors that are
>> exposed to the device. This dma buffer is shared with the user
>> application. When the device consumes a buffer, the driver moves the
>> request from the used ring to available ring.
>>
>> The driver exposes the buffer to the device without knowing if the
>> content has been updated from the user. The section 2.8.21.1 of the
>> virtio spec states that: "The device MAY access the descriptor chains
>> the driver created and the memory they refer to immediately". If the
>> device picks up buffers from the available ring just after it is
>> notified, it happens that the content may be old.
>>
>> When the ack() callback is invoked, the driver exposes only the buffers
>> that have already been updated, i.e., enqueued in the available ring.
>> Thus, the device always picks up a buffer that is updated.
>>
>> For capturing, the driver starts by exposing all the available buffers
>> to device. After device updates the content of a buffer, it enqueues it
>> in the used ring. It is only after the ack() for capturing is issued
>> that the driver re-enqueues the buffer in the available ring.
>>
>> Co-developed-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
>> Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
>> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>
>Applied now to for-next branch.

Cool, thanks for that!

I just wonder if we should CC stable since we are fixing a virtio
specification violation.

@Michael what do you think?

Thanks,
Stefano

