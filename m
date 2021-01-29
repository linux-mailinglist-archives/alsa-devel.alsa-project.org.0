Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEE73089CA
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 16:13:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 718EB16B5;
	Fri, 29 Jan 2021 16:12:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 718EB16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611933222;
	bh=CNQs3wKQPsJh8ijG/gNPs8GeXLOF8aUoky2DOjC12Gc=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LqiTeqTO62Se7Emz0VNou6ewar4vQR33pJ7j/qSTtvGEoBHYpJvP0ppx2Un0+I40L
	 GBp7g1KBKKfrLoyg/PpJVD7pbE866Lfd+iKscf0LzXZBPBrL3Cmoru59HxI2jgae5F
	 /5gLg10S8SR7WOgqGp216Ruzf+vtnSb+zUGquyLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70B85F804EB;
	Fri, 29 Jan 2021 16:10:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FEE3F80259; Fri, 29 Jan 2021 16:02:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51752F800EB
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 16:02:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51752F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="CNZUkckd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611932563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7RroJfEDxGjb7Jc9YxMpN+s63RPRuZMmzf291mmLKRk=;
 b=CNZUkckdh/U45Oy+SDSAc7JDoTyogyXJmwtX59DHP04bkrPN5B5FFWbaspVvPr+BZU3dFu
 a6debiaVrFQVJ/YWWsGGN4vAQxJOxzNA4Ohay72eBCg45NmwAh8GBwnGsNXD963YDev8qO
 +uGWNYsvBqVFGDPHmiMbHI21v+5LIEQ=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-5Ac5-1Y7OH2f9avwgZ_hhA-1; Fri, 29 Jan 2021 10:02:40 -0500
X-MC-Unique: 5Ac5-1Y7OH2f9avwgZ_hhA-1
Received: by mail-il1-f197.google.com with SMTP id x11so7877592ill.17
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 07:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:message-id:in-reply-to
 :references:mime-version;
 bh=7RroJfEDxGjb7Jc9YxMpN+s63RPRuZMmzf291mmLKRk=;
 b=srFMgrQ+8n8xb6YptAe6JqTvgTZ3/43Xj2DeEa6ES+QJUQyrmE+8kW4DTWEl49uV5L
 XzEeFLWY0aBTvnqcAvpEzQgCthAhxMS6rNcBxlidRiQqB0hIx1dWEZXnvorGoXvqtYq+
 s+gOxs+b/kJEf8iXPdIpGWryvxU2C8FezeYLkqxyzQaTM2pl6vYM2szbUkH0khsjUkAU
 5zQmvQvq+jwLN+PpLRjG5iepFiULuNKVzIscoqSkyGo3DhK1QWbc0+mYC+qHGorHFqsQ
 eU8V7eeXKkbPMUV3XMgHT395PcYnx/bmuQ4AIt5zn+2L0ySc/eHZEOGawQouQXOGyo4L
 DK4Q==
X-Gm-Message-State: AOAM533dzr+VDnMoExJ8wsm3Avn/Jq62iIdOrrjyL2i8ULmp8sAxoCP6
 Y38sMY2NZqGPPUhZF6G4XrXGBlSi4DvnFPFNrgyAyPCCkmjSDS7qfTQ3oK10ENZDZS/fXCZucSB
 jt1ewaWKSU8KALwH4l2FjOxQ=
X-Received: by 2002:a6b:d80e:: with SMTP id y14mr4224034iob.101.1611932559770; 
 Fri, 29 Jan 2021 07:02:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5oxZTuOmqBKSLwJx/J3u9ZYl6uzFThiv054pyINuKVRliQ3+gxAl3t9IlrGllYCZ8NdH0Yg==
X-Received: by 2002:a6b:d80e:: with SMTP id y14mr4223997iob.101.1611932559215; 
 Fri, 29 Jan 2021 07:02:39 -0800 (PST)
Received: from chargestone-cave ([2607:9000:0:57::8e])
 by smtp.gmail.com with ESMTPSA id c9sm4591978ili.34.2021.01.29.07.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 07:02:26 -0800 (PST)
Date: Fri, 29 Jan 2021 09:02:18 -0600
From: Michael Catanzaro <mcatanzaro@redhat.com>
Subject: RE: [REGRESSION] "ALSA: HDA: Early Forbid of runtime PM" broke
 =?UTF-8?Q?my=0D=0A?= laptop's internal audio
To: "N, Harshapriya" <harshapriya.n@intel.com>
Message-Id: <U3BPNQ.P8Q6LYEGXHB5@redhat.com>
In-Reply-To: <BY5PR11MB430713319F12454CF71A1E73FDB99@BY5PR11MB4307.namprd11.prod.outlook.com>
References: <EM1ONQ.OL5CFJTBEBBW@redhat.com>
 <BY5PR11MB430713319F12454CF71A1E73FDB99@BY5PR11MB4307.namprd11.prod.outlook.com>
X-Mailer: geary/3.38.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcatanzaro@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Mailman-Approved-At: Fri, 29 Jan 2021 16:10:20 +0100
Cc: kai.vehmanen@intel.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
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


Thanks, I'll attach the requested information (dmesg and alsa-info.sh) 
to https://bugzilla.redhat.com/show_bug.cgi?id=1918933. I see codec 
info is included in the alsa-info.sh.

On Fri, Jan 29, 2021 at 1:37 am, "N, Harshapriya" 
<harshapriya.n@intel.com> wrote:
>> Does reverting just this patch fix the issue you are seeing?

I would expect so, but I didn't actually check, so I'll do another 
build now to find out for sure.


