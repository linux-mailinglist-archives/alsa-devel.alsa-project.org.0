Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9208514D4F4
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 02:22:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22FF51674;
	Thu, 30 Jan 2020 02:22:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22FF51674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580347371;
	bh=HOfb+s5MUuwfdQwx1UJM8q+hkwKIEFdv08KTVjE7Dog=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jhA/HXmIxDMYvik9++Ky9xuawtK8wJtBiglDhMW+lppFNK6L8C9ZLpt8wbvRaZLmb
	 TYDQLgKR9w+Z9ATTjlp7WCPCWhZSt3zHAe07RcqVB01lv4uHlzVM7ILyZyX6TKGyYD
	 5SWnjM27XIpVlRlxhqrHijcCH4I5Gj6vFmwxOLEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43B26F80229;
	Thu, 30 Jan 2020 02:21:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA20FF8021E; Thu, 30 Jan 2020 02:21:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B407F80122
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 02:21:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B407F80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="m/bpNEGw"
Received: by mail-wm1-x330.google.com with SMTP id a5so1904730wmb.0
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 17:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vXPPNjWVMJNL/7mfVdxyS42LmoJiWkZybxeoijRbW4g=;
 b=m/bpNEGwlbSeyjjCZZ3m8aV9wPNrFSPaLqMUWKbeTnylbiT82yEKv0TU6CUzXN9AgA
 qRfNkFnK/gi6JqEkMOt9ovtMDGFBB95FiuH2WCLCks0nHj7LBCDmA8fHDhBtIp7oaaqL
 JH/y74F2xCexSbhXYEuXhC1EOhLcpylmTJaN82JGObaeP45WLLoO2rEHv6DirmOjH3tC
 /bYrZPJBF+l5eu/n0jibPkaWUjKTdMP1oSbar2VcGZNm3wckE54dGIioopXT6KAibRc5
 1YuwXDpzbiZYSzWtAbxQ+qh1IQDoUY1uYa5LY/V05R779ByYZhssk6zPAjGmunyrc8l0
 LnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vXPPNjWVMJNL/7mfVdxyS42LmoJiWkZybxeoijRbW4g=;
 b=oIen+ZIHnJELRfGEQkfIarW17SiBXYohNBiMbW462QkpKsgiMVAo/DwPoHxMyGjqPI
 97itqn1DBXq27iCBqJT2U+QF0S0reJDy/qh6yJlYkKU7xtsfmVdOuv58V2mQHYeoTL7Z
 A7JQwrRgpzClE4lcFwB7IwwHU+7sBb9brC8wIZylDQU+WY3RrnSQkuHO4DjEk3rvG/Wz
 uiu/sKeq321oFYQE/ddPemWdPeE0uzdXi3lfwfvbaha/K8DlEwbxUqnatHYRsYmDo7Xb
 RowqCyUTAtFc2lAJ+ldcd6sv032nbFxDunj3Yj+WeHtF1zVmb3/gsLFt4IyYnqb0wplJ
 Kk/w==
X-Gm-Message-State: APjAAAXWMGZtpOY5N+dqZgtrBI6n7vveRv4INmhNQ6tc7k/qC9wiSCZo
 LdOm9gU3zGLnOOXge9tbb0MF2roN
X-Google-Smtp-Source: APXvYqxITJZX1aKQ7ecT4HGuN9IfkzBsiwPex32jGmB539yBQr871zob6kI+nyW/xOM34wRC1JkKVA==
X-Received: by 2002:a1c:cc06:: with SMTP id h6mr2086679wmb.118.1580347264141; 
 Wed, 29 Jan 2020 17:21:04 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id i8sm5320849wro.47.2020.01.29.17.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 17:21:03 -0800 (PST)
Date: Thu, 30 Jan 2020 01:20:54 +0000
From: sylvain.bertrand@gmail.com
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200130012054.GA25217@freedom>
References: <20200129232340.GA23769@freedom>
 <fffaf462-fd7a-6d09-e808-21d94f883365@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fffaf462-fd7a-6d09-e808-21d94f883365@linux.intel.com>
User-Agent: Mutt/ (2018-04-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] no period wakeup support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 29, 2020 at 05:43:19PM -0600, Pierre-Louis Bossart wrote:
> Note that you also have the case where you cannot disable interrupts but can
> still use timer-based solutions (e.g. for USB audio).

Oh, Ok. I'll probably stick to the classic model then.

thx for your time.

regards,

-- 
Sylvain
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
