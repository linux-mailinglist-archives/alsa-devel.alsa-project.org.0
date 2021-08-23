Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C18F83F4E6B
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 18:33:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 330F9850;
	Mon, 23 Aug 2021 18:32:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 330F9850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629736410;
	bh=lJvhGaXGvd8WXptBMQSI3ZhWvf8j66qyNO4aDaPi6uQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hU9QumLMtm6073+AkKMO9CxgVI9PSmSw6AdE5Yq2hGsMX4uZugS0RF+18O+n9zzWK
	 y/vSDq+nshMG/s1aFcMoWVzkag+u4CiZ+h3CgQqox43YY+DkuVgwry8b8KhL355qty
	 JGype5LGHuN0GZWA3xW/LdPk9oGG4E+Umf2vHBGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 930C8F800AE;
	Mon, 23 Aug 2021 18:32:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94345F8020C; Mon, 23 Aug 2021 18:32:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0E53F800E7
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 18:31:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0E53F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Be3NzALA"
Received: by mail-lf1-x132.google.com with SMTP id r9so39156218lfn.3
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 09:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fnQv1MgXBg+b8w2Jbx1fNjCH8gCjXhSgvlwQZtj/FBM=;
 b=Be3NzALAzNhsz92au4WUCSCKWLR1H6XEseUDK4vc+vJuVpw+IMYXTJAQevHofS94jy
 O074KhsmL6h+cY1EZpP3FdQFfDvWI1qIyYQJKYb6k1ecnadUruTQop8+CrYQjfpAABon
 boX0s/8BpbDNedmh7vmbNk9x4yz6mFSD1yYQs4GIgZtC1N0smubY1XHoEfHlAYNSpEPB
 QoyZNYiklwpAYscnsilWm7YdghT40SBu4rdObcYNqxDUtQT+DvwhC2BSI+DH4nHgG/Ea
 bmxxqEQdkYz0/nzPTVJ8LQiSHW7xQX4KhbXsoKi1UBBgmnKiPITkquoqfGBQtGd3DWmm
 3GbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fnQv1MgXBg+b8w2Jbx1fNjCH8gCjXhSgvlwQZtj/FBM=;
 b=qvRBxlbB3vOeL+/rI27STtY6pFTf4KuddpcXD5Jsd/RORlPA1f84xiWFFxkT7h66YL
 DipoFqie/Gbw2klsZX5RdRZrGXCedQjgdmF6zZQBKcUJprTHoHJ9u4F7NQmN+TKefHIQ
 ZcxIFz6czuSILxM1XZ0YUU8V+A8Mi/IsCT3aUNItbzWIqAZecY8WUs89LU+Nyk5VXPkr
 ZKEjoeeFsPWpPNdDSAm9wGFUp8nfEvBgkZ+GXkgX6fbV3ud7jssU4jFPq2lYG4AtmasX
 vHlb8BogrOSOgP4wblEJfdWTa+9wQ/ClsaxiBtT/RwzwCszKxrpAVU21t92UAhXW8VdR
 +8iw==
X-Gm-Message-State: AOAM53025Wrab0Tk2ErUKqODt6zQWQ8c0vH9z4I2ipf7VqKuPPsNN3H6
 vqZyjWRUNWFlXoJWm9zIUKDct0lV3oi6N0vTnpA=
X-Google-Smtp-Source: ABdhPJwjp29bnQ8NZPUPo4Lxn2GIA2e51/e00wViBTyu+xz1J2mpJY0AwgYf4osB8zZXZr13u+FEhGEuFFLeBwLUZ+s=
X-Received: by 2002:ac2:508d:: with SMTP id f13mr21789001lfm.576.1629736315746; 
 Mon, 23 Aug 2021 09:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAAd2w=btf3DZLbPuovAC9xo3rizmFeT4iAxJs6zNZwKxOnKT6A@mail.gmail.com>
 <20210819183450.GV890690@belle.intranet.vanheusden.com>
 <CAAd2w=YFhiJJ=4nqo7JfbrqdNWVxvSp06E=1XiHOXV8Kp2sgaQ@mail.gmail.com>
 <20210819190634.GW890690@belle.intranet.vanheusden.com>
In-Reply-To: <20210819190634.GW890690@belle.intranet.vanheusden.com>
From: sujith kumar reddy <sujithreddy6192@gmail.com>
Date: Mon, 23 Aug 2021 22:01:44 +0530
Message-ID: <CAAd2w=Z4rG1UwA6ELzqwr_0TXjQmD0T1izonAJk9-32TSzGchQ@mail.gmail.com>
Subject: Re: arecord is failing with -V stereo
To: folkert <folkert@vanheusden.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi Folkert,

In all version it is crashing.
when i debug these i found that p value is coming negative at memset.
the function snippet is:
in aplay.c file in alsa-utils.

in  the below function for  c=0 it is working when c incremented to 1 the p
value is becoming negative . so memset is crashing.

static void print_vu_meter_stereo(int *perc, int *maxperc)
{
        const int bar_length = 35;
        char line[80];
        int c;

        memset(line, ' ', sizeof(line) - 1);
        line[bar_length + 3] = '|';

        for (c = 0; c < 2; c++) {
                int p = perc[c] * bar_length / 100;
                char tmp[4];
                if (p > bar_length)
                        p = bar_length;
                if (c)
                        memset(line + bar_length + 6 + 1, '#', p);
----------------//this is the line where it is crashing.here p value is
becoming negative at c=1.As we see if we change the p value to bar_length
it works fine ..As it is a player issue not a driver issue.


                else
                        memset(line + bar_length - p - 1, '#', p);
                p = maxperc[c] * bar_length / 100;
                if (p > bar_length)
                        p = bar_length;
                if (c)
                        line[bar_length + 6 + 1 + p] = '+';
                else
                        line[bar_length - p - 1] = '+';
                if (maxperc[c] > 99)
                        sprintf(tmp, "MAX");
                else
                        sprintf(tmp, "%02d%%", maxperc[c]);
                if (c)
                        memcpy(line + bar_length + 3 + 1, tmp, 3);
                else
                        memcpy(line + bar_length, tmp, 3);
        }
        line[bar_length * 2 + 6 + 2] = 0;
        fputs(line, stderr);
}
Could you please help on this.As the driver data is fine when we keep p
value to bar length and checked .
.


Thanks
Sujith





On Fri, Aug 20, 2021 at 12:36 AM folkert <folkert@vanheusden.com> wrote:

> > > > arecord is  failing vumeter option -V stereo only.
> > >
> > > What version?
> > > Because the commandline you provide works fine here with
> 1.2.4-1ubuntu3.
> >
> > 1.2.1.2
>
> See what happens if you upgrade to 1.2.4.
>
