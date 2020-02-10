Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E066157F92
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 17:20:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0512A1671;
	Mon, 10 Feb 2020 17:19:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0512A1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581351614;
	bh=+L8ZhJINxx9HrhFCa0yon9eeSk8Hjf9CBjm+PyCWzXY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I+12eqH6hOU8PF2dQYQZaKmlaMBa2R//PTa8ZRtWl8nE5w1CCCyLG3SgSC9KR18W4
	 BSIAjlEn2CFW1uk5ZZkRBiOMNHrJag9KvjVN5YAdgX3QFlGIq5+6UcGvHCnNdnEaJx
	 0esob1q7eKRdf3yKt/n/Y5efnsyxd+NULE0deD6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B173F8014F;
	Mon, 10 Feb 2020 17:18:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EEA8F80157; Mon, 10 Feb 2020 17:18:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFD27F80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 17:18:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFD27F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="mXyqE89B"
Received: by mail-qt1-x842.google.com with SMTP id l21so4799879qtr.8
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 08:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dps19KiRG56vaqgwmUdQKnnGpk1N6M2FjwFavketYfM=;
 b=mXyqE89B88xdQobrVDh/9y6yo3VBqYcC6wpGZvw3FnUkbahxB8sK9hwTbdZ3cwbuP+
 fCRbPEWVz0oaM6/377Ay8Xmy5wUOtglEdiCISkoreyOf2nWLm5SMVFexSA86N2cCg2/Q
 TMlwZAm1nfX5Co4ZbNrFoPKyr0WDjUMr7pz435p1huaph9oubdiL1F7FuBQe1LPA3IJe
 x6ABdrc/ZHcNLyOxxUp5c97jzLDvRM2u2m+E/mI4kmYS1O1Y3rsGoiXjrvORbrv8IjBr
 UXX+gBxR5zbMcdoBO2FED7Wdvho/HZhk8VEKISF8Z1hz7USo01T2hxS/EiYOZlkUewrO
 Btpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dps19KiRG56vaqgwmUdQKnnGpk1N6M2FjwFavketYfM=;
 b=hRfWzZo5kRcyzZ9cB/VuqvhgKTpaTRIwbO7MzjNcrM5Beq2NLZji8KPW2RlZR5Au4q
 rivgjN8Odw4QHurl9ZJmQxPzSlQYY6s6bk0lyj54zg7A3/g5dnUevuTngsEgeW9P+F6R
 XIr76wq9WlXGoILPV7i1jLAC2SrpOUS85GYtY08tYfLM4BZpVPQ+LTvxuC2mbIcOo61E
 aFKriAo3ChcaoHJDJxDl7MESBM988mXmrxqB5NZlYZitFidaFbiz7c45eEgdAtTs7zaz
 9nw1dCC6mB4BXq2odH/XhnhLAz4aIsajjMG7pbEsdRGlTI+BJeyLOplG677JiiulXvYn
 bvdA==
X-Gm-Message-State: APjAAAWbgtabkMGO0v/LqFnPhUpSprY5WUWGvGHjNqVnl9MwgLfpX4NP
 mAVQq84yg96rlUhzO8Mt9p2CjDn7exj7T3c0UsfzRg==
X-Google-Smtp-Source: APXvYqy3JmhawUCO7F/shsyWgDnaSSHvNFygpVTzdf64f5lEPX666OrrCtAwRwr3ylYse2yYaHMRY/Yiu94hL/ssR+4=
X-Received: by 2002:ac8:33f2:: with SMTP id d47mr10902183qtb.24.1581351499610; 
 Mon, 10 Feb 2020 08:18:19 -0800 (PST)
MIME-Version: 1.0
References: <1581322611-25695-1-git-send-email-brent.lu@intel.com>
 <00ed82c4-404a-ec70-970e-56ddce9285ae@linux.intel.com>
 <CAOReqxhHfTuj6mxeX2e_ejMY8N4u+BFLfzKDgn=y5EbWLL_joA@mail.gmail.com>
 <a0aa0705-8d74-3316-13f8-8661d31e928b@linux.intel.com>
In-Reply-To: <a0aa0705-8d74-3316-13f8-8661d31e928b@linux.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 10 Feb 2020 08:18:07 -0800
Message-ID: <CAOReqxiNomQ7OOoE8LHWKH_LkaerSgsO-Yr4918Az2e_50THaA@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Fletcher Woodruff <fletcherw@google.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, "Chiang,
 Mac" <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Brent Lu <brent.lu@intel.com>, Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: da7219: check SRM lock in trigger
	callback
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

+Fletcher Woodruff <fletcherw@google.com>
See comment #3 in the bug. This is not a GLK specific issue. If I remember
correctly Fletcher found that this was occurring on 2-3 platforms. SST has
the ability to turn on clocks on demand which is why this has not been an
issue previously from what I understand on the bug.

And that is a fair point, we do need to consider other users of the codec.


On Mon, Feb 10, 2020 at 8:07 AM Pierre-Louis Bossart <
pierre-louis.bossart@linux.intel.com> wrote:

>
>
> On 2/10/20 9:44 AM, Curtis Malainey wrote:
> > +Jimmy Cheng-Yi Chiang <cychiang@google.com>
> >
> > This error is causing pcm_open commands to fail timing requirements,
> > sometimes taking +500ms to open the PCM as a result. This work around is
> > required so we can meet the timing requirements. The bug is explained in
> > detail here https://github.com/thesofproject/sof/issues/2124
>
> Ah, thanks for the pointer, but this still does not tell me if it's a
> GLK-only issue or not. And if yes, there are alternate proposals
> discussed in that issue #2124, which has been idle since November 25.
>
> What I am really worried is side effects on unrelated platforms.
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
