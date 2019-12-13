Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E005811E91C
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 18:24:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B1491687;
	Fri, 13 Dec 2019 18:23:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B1491687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576257849;
	bh=Cmka3WrqJfIT2p0wNgWrpmIMOagUuPD7qf7UtgzENZk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G3vBVyxVtj5i1P2fG/g3xAAYLla3/5vDJMIzZ14RjGw9Uv8bDUfNQ73JWAOLpaIkt
	 h+gWXCGE+KTwovHcVV1dnuZJOmJ2fMQ/yq32uv+YDS+pA/J7wDjIQ+h/PmQ93Pq/wm
	 2u+v2ZELjIkesPPFvPAF1hTaP2SHHWgEY1zdjNtk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B547F8019B;
	Fri, 13 Dec 2019 18:22:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01985F801F4; Fri, 13 Dec 2019 18:22:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2364F800AB
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 18:22:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2364F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="dCx+E9Ei"
Received: by mail-io1-xd2e.google.com with SMTP id f82so354178ioa.9
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 09:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mjEBGpIV8dfJoPpjnBD7QQhqb16t0QpmMDHNzqt3GB4=;
 b=dCx+E9EiDVm6WwrjxpRclSWpiVC5ZyufgBvc/7SZItBHf4vWpz/uIuxWWn5qSshtma
 v4k5SmV/JnjoCUaptlvNpjXeLNkeTX2ZwmlwOaiBCbD/JCVSHW/7D3tIZ1v8NbN+9QZt
 b/5JkOWE0jURrwOZEl8aMgXD3q7Z6uSmi3bitoqgF+ASfU+VGRZdkM7Sx1hcHiUOrkMh
 4NgkFLLUHqm7+06tNLiohmjMn+Q5CEPeKvwLrpu3EXukAZTh9UNEPQqVQKXrRYoBhhsF
 izujPBBOZnDZclUZ39M+OFcsD5iDSyCb16CllQLox/KKW3EYqCq0iubqq2So5OPIvkvC
 9YjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mjEBGpIV8dfJoPpjnBD7QQhqb16t0QpmMDHNzqt3GB4=;
 b=dql7VwoH6PRtn5Wp6tUnyOwOnrxyulqV0qF42R9gryFW7/t0kVMloos16ju2ivu0eP
 P18e0A+5oybUcKHCL9kgrJI+K8SwI6LIzIEf84Ks+6oolRPpUJPlAs0Bu8GdINu6Gq7P
 1eU2CoZnF5XOuWc/SvIlxoCMvDg4RRB8SzNl2kNS3mUBcF8tf757LqoMxnXLyP2a+4k3
 m8NFMPEXOy2D7PXncLlQ8D360Sh+ATISBI6sVOVJV5+OPxw8mGNhfivcupmzccAPeDVL
 VmJ9PogQif4JGmgAV+b6QWlhD97f1TtOpiCpHnB4dCx3K09dgjzLnlID1xv/Op07w2Fz
 kyDA==
X-Gm-Message-State: APjAAAXKzR3YJlQD8EdzKV+lKmRsaYPIVfjBDtFdep3Oin1pp+kQP79v
 QmGV4N30tEkuCael943oSGzeQkZJLEYn3Hq5hsPGJg==
X-Google-Smtp-Source: APXvYqxeFYkFBS8NNi4XsMCBPTPKXlDhBh09Brh0FjDHejI7FBClQP781/RD6ghCP7N8iY2j2f8WQtyKytbzEyXvYkc=
X-Received: by 2002:a6b:5503:: with SMTP id j3mr8218284iob.142.1576257737234; 
 Fri, 13 Dec 2019 09:22:17 -0800 (PST)
MIME-Version: 1.0
References: <87mubx59la.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mubx59la.wl-kuninori.morimoto.gx@renesas.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Fri, 13 Dec 2019 09:22:06 -0800
Message-ID: <CAFQqKeX7Mjv67oZoeKcXT1OuSACDB_CHNmn=fOF=vyVW36OScg@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 00/15] ASoC: soc-core cleanup step7
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

On Thu, Dec 12, 2019 at 4:56 PM Kuninori Morimoto <
kuninori.morimoto.gx@renesas.com> wrote:

>
> Hi Mark
>
> These are v2 of codec_conf cleanup.
>
> ASoC has codec_conf, and we are using original
> dev_name, of_node for it to finding codec.
> But, we already have snd_soc_dai_link_component method.
> We can reuse it for codec_conf, too.
> This patches are for it.
>
> Big change from v1 is
>
>         - COMP_CODEC_CNF(_name)
>         + COMP_CODEC_CONF(_name)
>
LGTM. Thanks, Morimoto-san!
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
