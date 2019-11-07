Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A0CF3B70
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 23:33:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49B301680;
	Thu,  7 Nov 2019 23:32:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49B301680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573165986;
	bh=pnr5r5nNugPe3CUl8T4Rns57VuBiYnZvTpP47wOs+MI=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Gu4iSosi5MHtYF3iO1WqGJW7/a6vKqgUCqKSOiQexpXCDJFSh15YMFnbrQ926O3fb
	 tJu2AuKuQvkjSlU9xYLyJjqUHdtmYngxbweJHaCJMZamgKBU9JRKd2lEQ2cduMgHjX
	 jnMv4528yVoU0keIsos6lE/Zya/TjEGmH4fIBG6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EB69F80291;
	Thu,  7 Nov 2019 23:31:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 305EAF8049B; Thu,  7 Nov 2019 23:31:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D0E3F80111
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 23:31:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D0E3F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="WC4P/Kd+"
Received: by mail-ed1-x531.google.com with SMTP id k14so3394008eds.4
 for <alsa-devel@alsa-project.org>; Thu, 07 Nov 2019 14:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=R4Kdr4iwB1HzR/4qWxmVF/2F6FEqGFVuQ+Tfeyx6ZOk=;
 b=WC4P/Kd+lP5+qxOwGgyXrzErdAfSsGbcpl1M3eCHtd6WCh7qQuS453S268BsQziGcu
 gm5LtWmf+6f6kyadWniwnuLglvYBxPHrdvV/5EICmP6z1IB9z4ad4u1p+j4ybbE3Sabg
 frKzwnvYdd4kPhOgv9jrwPDYYhH0mRA4sSZfoSv08dr9p3ptOTiTythJc6pF2Xk1HcwB
 bZzSskbHPSo5HeaAn+3Wu4FYNJyCckBqzFuo0qZ+HcNsOIthWkvNTAjG1k0g8AbHHc/K
 HGQGepwUGZlZMTA9kxnlJ/fmXQ4NVjy2OEIycbtVQs21JwQfyqDBSFzdzErg3lM5oGTU
 uu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=R4Kdr4iwB1HzR/4qWxmVF/2F6FEqGFVuQ+Tfeyx6ZOk=;
 b=E1WKTDADMb1kjwdGF3MMEerp9WaUG9tT+x9YuGB8HD63oF9C2SlVrf01LNM12vkWvr
 QyxWagZesEQZMRBoqDCi9a2njeM6EUp45YPJcRK/GgjaxPDB1mUZkYRm8OMvSEoIY2KV
 L/ns0dUb9gJY48x5NVjZ87oa3/lwJz23V3kZIbl5ichstGPAohChz3f3mQEuxuSjY0Vz
 2GDZeaa4kmZcwc/AJFHkrLmBREuaCEuIGyqnDgZgBbKHPD3GfV2NVtwTngfz1EwX8PrK
 ljBQq2UMsjZVRyNnU4kA4Rrv0yym2H6rgta+pv/E6bsjbGNQpa0o0H4AmuY3KLPGX5Pm
 aWmg==
X-Gm-Message-State: APjAAAVMw5c5UL8K8EqG+YoIpR8H/B10VdcV3RrudXt6TPC9jgV82wmy
 2gXmu8iH0cm+7U2t0EMSRfwwTgxH2ptTuQzMatgldg==
X-Google-Smtp-Source: APXvYqz2j19agGHJf94/WGDIRV4zr1/2j+BZNySPCco15awqPZTwTsesk2u7m/RdtmRkDx19Wv4kSJg4ALgxMH023Ds=
X-Received: by 2002:a50:8969:: with SMTP id f38mr6503010edf.211.1573165874581; 
 Thu, 07 Nov 2019 14:31:14 -0800 (PST)
MIME-Version: 1.0
From: Ross Zwisler <zwisler@google.com>
Date: Thu, 7 Nov 2019 15:31:03 -0700
Message-ID: <CAGRrVHz0LZOXWprAqR+_e59k+NQwiax7je4dSHf85yeHepHV+g@mail.gmail.com>
To: Bard Liao <bardliao@realtek.com>, Hans de Goede <hdegoede@redhat.com>, 
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Cc: Curtis Malainey <cujomalainey@google.com>, alsa-devel@alsa-project.org,
 Jacob Rasmussen <jacobraz@google.com>,
 Fletcher Woodruff <fletcherw@google.com>
Subject: [alsa-devel] issue with jack detect using rt5645
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

We are trying to get a piece of Google hardware which uses the rt5645
driver working correctly with newer kernels (currently one based on
the latest v4.14 stable), and noticed that the following commit:

commit 6b5da66322c5 ("ASoC: rt5645: read jd1_1 status for jd detection")

broke jack support for our device.  Basically with that patch we never
correctly see a jack insertion event, and audio is never routed to the
headphones.

With just that one patch reverted, things work correctly on our
system.  The revert applies cleanly to linus/master.

Here is the series where that patch was originally upstreamed:

https://www.spinics.net/lists/alsa-devel/msg64331.html

If we reverted that patch upstream, would it break other devices (the
"GDP Win" device?) that use the rt5645 driver?  If so, how would you
recommend proceeding?

Does anyone have one of the "GDP Win" devices so we can test that and
our device and make sure whatever solution we end up coming up with
works for everyone?

Thanks,
- Ross
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
