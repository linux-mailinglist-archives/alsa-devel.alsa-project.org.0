Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5B83089E2
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 16:29:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 405E816A4;
	Fri, 29 Jan 2021 16:28:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 405E816A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611934185;
	bh=yBEgR6UTlTmomeMc32+p1+2n8EgYe+tG+9k411vtP40=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rNHIVURkD/JCr8w6M77eHWJBH3UVzN1g7jVHuy7iT3ln5Wr/UjN5VO8tcm8HkTJNE
	 aPJqyfkmwDhSXSHx+Ad258PTxCHAQJde96fmI0pKQgopaIXSSNmQfzWJ+GE1d+7c2J
	 3KY5k/HyhK8Gn3SqGc7cH3RYrRNmKCr4Nz85cHAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B761F800E9;
	Fri, 29 Jan 2021 16:28:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 261CAF80259; Fri, 29 Jan 2021 16:28:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82586F800E9
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 16:27:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82586F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="gOAojrCM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611934075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b3AxKGv9HHn9gKincVulvwoQp8VZInYLdqmhBvv5Uug=;
 b=gOAojrCMMpSar9sx74VYsGIDiq+8DFmkwfph9a1Yb1v2LRoXQZzooXZYAa84AyX9uqNmt7
 A4CTu+WbFzrDKlkQWAUiXHT8oz4lzg2HUjMr+7kGs0mc31y2AEGayHDELhKfMV9UcA+jrt
 4HlHvShvZhgZgGIj/UIkb6Wpvonhxfw=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-XpeAenXLN2q9PG6DN64Bjg-1; Fri, 29 Jan 2021 10:27:53 -0500
X-MC-Unique: XpeAenXLN2q9PG6DN64Bjg-1
Received: by mail-il1-f199.google.com with SMTP id s4so7922384ilv.23
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 07:27:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:message-id:in-reply-to
 :references:mime-version;
 bh=b3AxKGv9HHn9gKincVulvwoQp8VZInYLdqmhBvv5Uug=;
 b=gedfcm+4C4ukL/UEO3f6kLxrCtpf0Zzv8xcfJ7LAyCUp9ugleJmZRkt/Z/dXuVytMN
 QShnFgt+MjGfKqXzKTbPYOJlRSZR4g/R9adyK8uF+MInOBJ81S25iYCafYrhViJ7f7t3
 C23UH5OOT70zTp/CjaeXZbfNDk2VtAVstdL7G+Ck/5IEczjKVm/FHadHvQSw5b5PUxnu
 Nh5S0fs1jR9V2olUpyWFoISB/llHFqLKF5HeQUHxABMJd7L1+yauZOrLlIRKEnh2eMqa
 NbZaJzk75GTnrwFGSqB6nJ0BJOkDsu97SaWchKwGT522Jgpa/7VlxovvLl8D+ZCapczQ
 yFtw==
X-Gm-Message-State: AOAM533BKncI1FDrq8kXeXjilpjaHT7bHIQrl7pS/qyCs2V/wMKK7ZMA
 KZ0LSug2Vo24f+yTnra6i/HerI7M5ot8eY3rSVPAFSzvB+z0F4ETcn7Rauw12hbwThxl1woLxHp
 CcscJJ54Xo52P5JamrQtYM0Y=
X-Received: by 2002:a92:de01:: with SMTP id x1mr3539439ilm.307.1611934073033; 
 Fri, 29 Jan 2021 07:27:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyTAbVTj4YfUMsQDHyc6fcHVSM2WYT4LhhKE1k0fgs6g7q3ksky2wWjgq5Vts5wSnbkkmMqg==
X-Received: by 2002:a92:de01:: with SMTP id x1mr3539411ilm.307.1611934072666; 
 Fri, 29 Jan 2021 07:27:52 -0800 (PST)
Received: from chargestone-cave ([2607:9000:0:57::8e])
 by smtp.gmail.com with ESMTPSA id v7sm4506080iln.79.2021.01.29.07.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 07:27:51 -0800 (PST)
Date: Fri, 29 Jan 2021 09:27:45 -0600
From: Michael Catanzaro <mcatanzaro@redhat.com>
Subject: Re: [REGRESSION] "ALSA: HDA: Early Forbid of runtime PM" broke
 =?UTF-8?Q?my=0D=0A?= laptop's internal audio
To: Takashi Iwai <tiwai@suse.de>
Message-Id: <9ACPNQ.AF32G3OJNPHA3@redhat.com>
In-Reply-To: <s5hsg6jlr4q.wl-tiwai@suse.de>
References: <EM1ONQ.OL5CFJTBEBBW@redhat.com>
 <BY5PR11MB430713319F12454CF71A1E73FDB99@BY5PR11MB4307.namprd11.prod.outlook.com>
 <U3BPNQ.P8Q6LYEGXHB5@redhat.com> <s5hsg6jlr4q.wl-tiwai@suse.de>
X-Mailer: geary/3.38.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcatanzaro@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: alsa-devel@alsa-project.org, "N, Harshapriya" <harshapriya.n@intel.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 kai.vehmanen@intel.com
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

On Fri, Jan 29, 2021 at 4:06 pm, Takashi Iwai <tiwai@suse.de> wrote:
> Could you try the latest Linus tree?  I guess now it works, supposing
> it's a runtime PM issue of the VIA codecs for Clevo machines.

I've tested this commit from Wednesday:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=76c057c84d28

and the problem is not yet fixed there. If you suspect it's fixed by 
something merged in the past two days, then I can pull and try again.


