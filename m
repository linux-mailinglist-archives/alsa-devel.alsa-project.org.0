Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7B11AF847
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Apr 2020 09:44:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85C451665;
	Sun, 19 Apr 2020 09:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85C451665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587282249;
	bh=SBnaJXMWlP5Jfz/aC8h2Gcq214H5zmesYB/TAZzBqdc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mtQKNGTOD0GYOpHFW+odleSj61eUFQKl6poKS8fRuE+pa8SM4x85qMCY1efL4dpxw
	 Luj1V7dykixskrfIGJWpDQs+aM/w3HBMCwhc3PcG1lA5oJhG3Sx4K4PzidySCicnLt
	 CrkVOQrGedB3lXbIAfnU1djiiZtUlYQhoLDLa3ag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C08FF802C2;
	Sun, 19 Apr 2020 09:38:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71604F8014E; Sun, 19 Apr 2020 00:20:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD170F80122
 for <alsa-devel@alsa-project.org>; Sun, 19 Apr 2020 00:20:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD170F80122
Received: by mail-pg1-f195.google.com with SMTP id r4so3095155pgg.4
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 15:20:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5lJaFjYcZIrKINzwKQy1R3xgWxtfsMwR6sB1R/eMtwU=;
 b=G/zPv4kEALqr3LRHjq+1CF4CnGa85IP57YhPb3gg8Njleo4BYoS/HdAexKCnzfpcJu
 /Mgure+yJcEBFmPKej/HYBBatzeNAZx9OsPlzMupCsEScuWGQc+VXP97hS3CcDQcXccD
 etYBCFc/SaK1rD9fvsor3rESr8l7KCWvPozkes/3pJqOVdkDH1sCIoolzjyTf2+3C0e0
 oejykpXh08tH8T1vxHF3Kn3NNgVn/QBxuuJORyNgrMOWugetKfHXpe4ORKC67OSDr3Bl
 PRtrh8973HO5jboA+zV6dkXaL9t4C+L4giJEUDCXEiVoCqQt5x9NpIzsJWOYaV0G0sk/
 oiXA==
X-Gm-Message-State: AGi0PubNQhp4wEMgqFgdWQwunHJuhj5v84Y4ZnCAFkf66UhbUdlbbreQ
 K3SjWw/kOPTUAteW3gFYrxI=
X-Google-Smtp-Source: APiQypKrKkW1CP9zvg0HpaxgHFnkJUL1mC4k4+CRal+TZ48iPbm1ertqTrjT7jN+bYBQFGm5GWkzYw==
X-Received: by 2002:a63:554b:: with SMTP id f11mr3245678pgm.343.1587248435352; 
 Sat, 18 Apr 2020 15:20:35 -0700 (PDT)
Received: from [100.124.15.238] ([104.129.198.61])
 by smtp.gmail.com with ESMTPSA id b189sm14519134pfb.163.2020.04.18.15.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Apr 2020 15:20:34 -0700 (PDT)
Subject: Re: [RFC PATCH 1/9] kernel.h: add do_empty() macro
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20200418184111.13401-1-rdunlap@infradead.org>
 <20200418184111.13401-2-rdunlap@infradead.org>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <f097242a-1bf0-218b-4890-3ee82c5a0a23@acm.org>
Date: Sat, 18 Apr 2020 15:20:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200418184111.13401-2-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 19 Apr 2020 09:38:22 +0200
Cc: alsa-devel@alsa-project.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Zzy Wysm <zzy@zzywysm.com>, "J. Bruce Fields" <bfields@fieldses.org>,
 target-devel@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>,
 linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
 Vishal Verma <vishal.l.verma@intel.com>, linux-input@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-nfs@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Chuck Lever <chuck.lever@oracle.com>,
 linux-fsdevel@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

On 4/18/20 11:41 AM, Randy Dunlap wrote:
> --- linux-next-20200327.orig/include/linux/kernel.h
> +++ linux-next-20200327/include/linux/kernel.h
> @@ -40,6 +40,14 @@
>   #define READ			0
>   #define WRITE			1
>   
> +/*
> + * When using -Wextra, an "if" statement followed by an empty block
> + * (containing only a ';'), produces a warning from gcc:
> + * warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
> + * Replace the empty body with do_empty() to silence this warning.
> + */
> +#define do_empty()		do { } while (0)
> +
>   /**
>    * ARRAY_SIZE - get the number of elements in array @arr
>    * @arr: array to be sized

I'm less than enthusiast about introducing a new macro to suppress 
"empty body" warnings. Anyone who encounters code in which this macro is 
used will have to look up the definition of this macro to learn what it 
does. Has it been considered to suppress empty body warnings by changing 
the empty bodies from ";" into "{}"?

Thanks,

Bart.
