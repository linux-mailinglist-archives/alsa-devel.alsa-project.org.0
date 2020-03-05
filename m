Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7E317A774
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 15:31:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FCEC836;
	Thu,  5 Mar 2020 15:30:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FCEC836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583418669;
	bh=PPir/PPSrA0VH+YS6NKKoh5LNbJp8CNsLyxNxXY+CzA=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DPyiL4obW+miaBcyIiLl4OEIMI1Puzc8jUUDvzINzlnvjCjK+TXBoTX4TRj6oza2V
	 WBrVfj5lnJZrCM7nHoeB0iPziN3j9dZHtyGFHpr/MJbUm+5mc/FaSaKWuhcska6mDM
	 dP21toB8GwjHlLDyNK+6CoNkASfdhH2QU00RsAUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 460F8F800D8;
	Thu,  5 Mar 2020 15:29:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 061F2F8026A; Thu,  5 Mar 2020 15:29:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94A99F8012D
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 15:29:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94A99F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="W5hpk0Jz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583418562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PPir/PPSrA0VH+YS6NKKoh5LNbJp8CNsLyxNxXY+CzA=;
 b=W5hpk0JzfQEnyONjxHhxncM78HJV/jMJipyAx5uRLZ8xJBv4C7y1lyOLP/JJsMEZ87Vj9w
 0ZqW+HqwE8jf4KEs00uhE+IDhjacAmHGGs/DLT7eVz0K3Ei2j9LzrvtTJ1KSn/3fouyKS3
 YxpT+OxHA/wCXMyC6j6kCHG/hWtuUCs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-iDmWGQKCNcGdwE3AggJbKA-1; Thu, 05 Mar 2020 09:29:18 -0500
X-MC-Unique: iDmWGQKCNcGdwE3AggJbKA-1
Received: by mail-wr1-f71.google.com with SMTP id o9so2376278wrw.14
 for <alsa-devel@alsa-project.org>; Thu, 05 Mar 2020 06:29:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=PPir/PPSrA0VH+YS6NKKoh5LNbJp8CNsLyxNxXY+CzA=;
 b=VFLsRKnLKVB/wsVstCoIIiUd212+jbEgYsY4wCzcYiLx75qoS4O21sqy01F3+bH6/o
 jZ7jAMCIU4lCM0jnccBjCZVIioFjuGXXRokQwG1ZvDWgTS4CO1sCvJ4uc+Loe1rY06qV
 3ilCRSBeQvy+tVzyfhlH62tBZUKse34rut+eKAMQhug246Myh7Ig+W7vSEcXay+qHjTo
 RrF1ZCDt+Cz+Z1scRRTiZdYrWtR/en8xFl8H41oHy7hNXw53JS5HFV5uLYA3JOSmwGb9
 Af3C83CruSJAPyBoaXQkSyk/UMK/zItlAxx7nr/cx0aNz+ydNhoxE6unwkgBFeMLsZPT
 iOVg==
X-Gm-Message-State: ANhLgQ2l8YiGhzVhaaPWl9IpdUh2izQT7K54VLZApoosXsgjgxN/8Y0U
 LsRLMZcZjsoy7crEpLLI/OQyvRFVPB8Tnck38GMWCvPYS19j4+s2ynTgArcibiD6lELzYxgNFW7
 QyXA2pPentqXZ0WQX1M9a8M8=
X-Received: by 2002:a1c:4043:: with SMTP id n64mr9864604wma.169.1583418556952; 
 Thu, 05 Mar 2020 06:29:16 -0800 (PST)
X-Google-Smtp-Source: ADFU+vv0miV96Vvo3rmBuK42aDD53H5hjBuFv3qy5rC9dGs7VCqV7z8rE/2hsL95OYBk5SYphvvAnA==
X-Received: by 2002:a1c:4043:: with SMTP id n64mr9864590wma.169.1583418556805; 
 Thu, 05 Mar 2020 06:29:16 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id i6sm11485595wra.42.2020.03.05.06.29.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2020 06:29:16 -0800 (PST)
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
Subject: snd_hda_intel.power_save=1 causes pops/clicks on Lenovo T470s
 headphone jack?
Message-ID: <9d23ce16-1333-abd8-1941-e4a58069677d@redhat.com>
Date: Thu, 5 Mar 2020 15:29:15 +0100
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

Is this a know issue? and/or is there anything we can do about this?

Regards,

Hans

