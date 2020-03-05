Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A312E17A78C
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 15:35:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 465721660;
	Thu,  5 Mar 2020 15:34:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 465721660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583418927;
	bh=p1Z+IOVUQzeYywja7KyK7SvpaI+UMQ3r+e3JGfbyrcI=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hxET47plm91N0cz+2qthU+b/tWg5BonT0HL7Fz6h0zex/h1jD6QhOWkw56zZiyMmn
	 AUZzzPXHPJEyvx4B51u/hG55+0E3HnUoYtPoasQ0h+BDODr29SphWk5vbWnOMQMov3
	 Wtx6kerTCzW8cAwcBYbYVEnrK7J5obszReP+681U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC7CDF80266;
	Thu,  5 Mar 2020 15:33:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CC02F8025F; Thu,  5 Mar 2020 15:33:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B51E4F8012D
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 15:33:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B51E4F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="AWn4p5PT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583418816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=p1Z+IOVUQzeYywja7KyK7SvpaI+UMQ3r+e3JGfbyrcI=;
 b=AWn4p5PTNg11pgI4PPtHLU7quEd5thvSrCxopAI4Y+elBx6eBa2sjCWuUxX7O6z4qVesbj
 DluXXiZQRVlaAhaai1YDWcHN9ZGj9bYj4Go5IUFyXppgHdDl5VzGCDoRCq26Fm9ElVAs7K
 SUfh6+mQLowaEovUu0t98T+ovL2pSo4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-m991P8IjNEqQINX2iR0hPA-1; Thu, 05 Mar 2020 09:33:07 -0500
X-MC-Unique: m991P8IjNEqQINX2iR0hPA-1
Received: by mail-wm1-f69.google.com with SMTP id w12so1654503wmc.3
 for <alsa-devel@alsa-project.org>; Thu, 05 Mar 2020 06:33:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=p1Z+IOVUQzeYywja7KyK7SvpaI+UMQ3r+e3JGfbyrcI=;
 b=Km6FDUo7ld7ywzlZVakSAp1kYBfPqct8K0/fxGsnteTskvCPrGc9YJgQK658GY2eBG
 GAtVNs6SNvoiHS5AylE8Q5OtpRQ6wPmEcXGxjxTAR6qsMX8hK7jjYvjLjfjxyAvP7djH
 TFqNTEtcVSm1Kbi7RRLlqQHdrLdJ5WtGjLNRkgNwerMG4UfmGTaxCx5gVCRebzx4MeKC
 pZeXI8aUTE/ucPsDJNm5WKUqrX9WImCOuEs7aWsnM2rqkWpRi3SE0+Hl4cOvJtUXhPHM
 QClay5aj9NJkCy9Z1oEL1Cr1eGS9qxXvw02yPP4RCXMjfJOzG2VA3FDnXPqcnlG0Lv+9
 PmFA==
X-Gm-Message-State: ANhLgQ0Uxzl49u0GDrFVD3GiE5KTX4uD7+5+INaDRFUdZEQZur29uY5P
 ze2YAdrTozGLYDM+UZFLLZYdvS5OkiRqBd6LLuckIc2U7GgOT10D+aLSIGLWaeiFEp8ACQLT0Kd
 ShRNa+yKYvg5bfGRyXMlPCNw=
X-Received: by 2002:a5d:4dc7:: with SMTP id f7mr7608289wru.72.1583418785760;
 Thu, 05 Mar 2020 06:33:05 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsGYCNpE5Px0C3uAqd32QbgrtmjhRoBzBHrKv5Xj7vuQiJ5EBJ/jFMV6ZegjSPlqPBrGMfZvQ==
X-Received: by 2002:a5d:4dc7:: with SMTP id f7mr7608276wru.72.1583418785586;
 Thu, 05 Mar 2020 06:33:05 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id w22sm9903286wmk.34.2020.03.05.06.33.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2020 06:33:05 -0800 (PST)
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Hans de Goede <hdegoede@redhat.com>
Subject: Automatically switching snd_hda_intel.power_save value when switching
 from battery to ac ?
Message-ID: <2ea1d6fe-aec6-71bc-3716-ae851fbfaa9f@redhat.com>
Date: Thu, 5 Mar 2020 15:33:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
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

Hi,

Because of a bug-report about power-saving related plops/clocks on a
Lenovo T470s, I've asked inside Red Hat if people with a T470s and
running a recent kernel were also experiencing this.

Most people are happy with the audio, but I did get a few bug reports
about plops on the headphones-jack.

One of the suggestions which I got from 2 different users is to
disable power-saving for the HDA driver when on AC, esp. since most
headphones-jack use (esp. with an external amplifier which amplifies
the problem) is done while the laptop is sitting on a desk and thus
typically is connected to a charger.

I'm personally not necessarily a fan of changing settings based
on being connected to ac or not, but I guess that in this case
it might not be such a bad idea ?

Regards,

Hans

