Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B950918A304
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 20:15:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52A911721;
	Wed, 18 Mar 2020 20:14:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52A911721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584558946;
	bh=tSJww9Z+wt5Z9Xn77VWgqIlhOoz7PLwBH1L5SgYZ3LM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ewNClsTfeTnDX/O9oEOYuNT1xeAGq89P2+PAQEwK2cAuRFrgxWQklRNFJ3qddvk94
	 EeYopak0m34/2Yf7m7c5H4zMLrKDZZO+tKyNBEy9VpV4eul7tX+dqvndm4QVcSJY3D
	 9TC74VI3WVg7liDYdRO9KSiy6VR8JHcUlFlLZAeI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC02FF80139;
	Wed, 18 Mar 2020 20:14:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A7BFF80139; Wed, 18 Mar 2020 20:14:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,FSL_HELO_FAKE,SPF_HELO_NONE,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB778F800C0
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 20:13:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB778F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="bX1vaYCP"
Received: by mail-io1-xd36.google.com with SMTP id h131so26237829iof.1
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 12:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tSJww9Z+wt5Z9Xn77VWgqIlhOoz7PLwBH1L5SgYZ3LM=;
 b=bX1vaYCPPB+3hM5IVwpSxpiwzeFNin8sOnyWNNukPjTxaOJVKUXxyjAgiDzEyfVe+h
 1BDTrfV3KvpphPOsLLKjxbnoiyuCk9Of+znC0Ud79tixSrxJ8LEPC3K0TfOgAXH5o/Se
 aW4TbGghUl/qsP5mLo+Ef6Kyl0dJuFpSCoYzpaxHYAHAvDkLKLwPOKRgZ2/u2vDsHo30
 MV45Egr04OdgQXHRvUYEPgE8uAuwD6+5nbURK6tqZ+0Oy5be6np4K7sRFk8Vpr8jHo0+
 MSLXOqKHxOV1cfAYNaxIumOb0w4d1wovXdnVrlH+1aciO1ZhkBB9gqMTJoG0lvQtnC5N
 QLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tSJww9Z+wt5Z9Xn77VWgqIlhOoz7PLwBH1L5SgYZ3LM=;
 b=o0ceXAkx2IC5qmZKv7maKMFjTD5mW4MdQFH2leaD56qlck/Pw0qCpUsxkfebrDTJuL
 dNbugw+sjge05/vEyAkM6t03sZMiTDjXDjV1JwnHOglvPkm+aR3MeDvM1tfxkA11zXlP
 9RMhVp30kv7a3G7lgsZ5k9l0F8DAtpq9bL9XVd8iNeB03YOZErj4dITqZpHH/ezYTuvI
 62S/cstPBQKm4+5h/WztD6dZLJ5tCXXhj1OZaFBAzZZZ6//XDdeMaiWU8mHXbRVFzck0
 Y289gHAhnEFAYlbXT4dQ6IWLxpNSuUsOsOIxT8OEjs7T9UZ5OqqYBCAVGVxLYGMRX5yb
 +l+w==
X-Gm-Message-State: ANhLgQ3bBBTiygBas1uNxz8RdYwNITjMbrgxWI1MEezVPiTBw9Qs95Kr
 xdap7bKdKWiyySTUFb5rWfepzQ==
X-Google-Smtp-Source: ADFU+vvxmOapBlydA+ixonR+vNYzcQ/Pqk4YMTaIcjCPOcsTiWrhK/t3R9pQW2Mpy4FH2QS+sTGdbQ==
X-Received: by 2002:a5d:894a:: with SMTP id b10mr2381488iot.38.1584558837246; 
 Wed, 18 Mar 2020 12:13:57 -0700 (PDT)
Received: from google.com ([2620:15c:183:200:855f:8919:84a7:4794])
 by smtp.gmail.com with ESMTPSA id u3sm2341022iob.45.2020.03.18.12.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 12:13:56 -0700 (PDT)
Date: Wed, 18 Mar 2020 13:13:53 -0600
From: Ross Zwisler <zwisler@google.com>
To: Curtis Malainey <cujomalainey@google.com>
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
Message-ID: <20200318191353.GA13459@google.com>
References: <20200318063022.GA116342@light.dominikbrodowski.net>
 <41d0b2b5-6014-6fab-b6a2-7a7dbc4fe020@linux.intel.com>
 <20200318123930.GA2433@light.dominikbrodowski.net>
 <d7a357c5-54af-3e69-771c-d7ea83c6fbb7@linux.intel.com>
 <20200318162029.GA3999@light.dominikbrodowski.net>
 <d974b46b-2899-03c2-0e98-88237f23f1e2@linux.intel.com>
 <20200318171912.GA6203@light.dominikbrodowski.net>
 <CAOReqxjmUCGX18y_XW_sjcU2xWha_+wJ7L+SuzJ5ZrOddCfZkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOReqxjmUCGX18y_XW_sjcU2xWha_+wJ7L+SuzJ5ZrOddCfZkw@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Keyon Jie <yang.jie@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

On Wed, Mar 18, 2020 at 10:25:32AM -0700, Curtis Malainey wrote:
> +Ross Zwisler <zwisler@google.com>
> Do we have any BDW boards that use the rt286 codec? I can't recall any.
> Also I never saw this issue, did you?

No, I'm not aware of any Chrome OS BDW boards that use rt286.
Samus uses rt5677.

I haven't seen this issue, no.
