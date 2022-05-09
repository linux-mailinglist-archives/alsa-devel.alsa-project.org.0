Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6786D520208
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 18:13:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8B3318DA;
	Mon,  9 May 2022 18:12:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8B3318DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652112828;
	bh=o4AVf+5DUfxZM6gF9JLFh7sbv1CJj+nCuVdRZIjldJ8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sGUlNTe415YQQras4eqpAA5GOfS/9rOpgzqfZc2EaH91+QGHYpaLg3+rVVPaQGnE+
	 BjEPD0AsMpMGtr+m6tdTHZXUE97maEfJeI1qx5mJEk1CtwgdGlTR7SGbCQS2oopJM3
	 73ULtn0QDB6PgBndKHUgBabFu69s71c/VSn+pCxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37957F80269;
	Mon,  9 May 2022 18:12:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A38ACF8025D; Mon,  9 May 2022 18:12:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CDCEF8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 18:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CDCEF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=howett-net.20210112.gappssmtp.com
 header.i=@howett-net.20210112.gappssmtp.com header.b="MUWSjX8X"
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2f7c57ee6feso150430437b3.2
 for <alsa-devel@alsa-project.org>; Mon, 09 May 2022 09:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=howett-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=o4AVf+5DUfxZM6gF9JLFh7sbv1CJj+nCuVdRZIjldJ8=;
 b=MUWSjX8XDJJmUb1T2XfuYtTSWOe3Kf1N51QCh9oXKRKcptBor/ljcyHA4Cz01huKdN
 dc+qIeDxOLgwLseFRR19fTDs7BPH15SnmJEkTqa0yOkPXkeXwykv4Mej/4KeJVT5hMn6
 OKbefV26lvPVHPil1Y6zLKwxITNNL85hql7Q2LMdJ1qldCc/t0ywwXM990eoWmg5aoo4
 tr+7bvT8k9q/xPBOA/wvLZxvu0G08GUDZ72iPx8gHZNHro+htnZ9tCpMNfYTyFFUWtvo
 fkQXBotK1ywy9hQPzfk0ToH65E75ptDGNDNLhTFl+uojf3/I7yzqcD7EwBkcGk72fZA2
 lCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=o4AVf+5DUfxZM6gF9JLFh7sbv1CJj+nCuVdRZIjldJ8=;
 b=xNSSFvusLi/0eI1etF+oPIwLHyi1pTUhl9hcVJ3TXJYNJaWWDGjEZBxCxvvCyyO4Sz
 04J+SWVoVw47uppplBKkUtiSFPVxJRPMEVZ+c8lxThE2JNngCbPdKIiVQmphEsKUWfQJ
 qYyYSIWSOkwfkKrTKNXByg8cfNp+OXQLGR4FApY05YtPYZr/+lx/aEe8ddeglCw/u8s3
 /fpvT/k5vPeI4qwq+b5YhTovKwp51NQFT5gSfUlcrxx3HmMKR1g3xjsmdHe2IsYUQ2/L
 n9+d5WkNHAu/gHcRh/h6u5ENPShuTzLXt1jiCNHlgb/QoPAMIYZQN0BUrHE9QhXe007M
 Hv4g==
X-Gm-Message-State: AOAM531T4p5MboDpztZpTbnLpTJYCWd9Xf2S2lRcWgimoGKuXSrvW2TG
 +Cd5M//G0HHdu3q4SkEIYWW4y7AZtKiEnv+IEfDuhcqtzWlnAg==
X-Google-Smtp-Source: ABdhPJw2Uaa1b1X1FLjux62ehGZyYndkSadmzQIqLXxttfRf+OvcW5dEhKyZC14Di9drBTYdz7tFPHLqaMtyF65g7m0=
X-Received: by 2002:a81:58d5:0:b0:2f6:8b01:b428 with SMTP id
 m204-20020a8158d5000000b002f68b01b428mr14893875ywb.389.1652112755975; Mon, 09
 May 2022 09:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220505151433.2893-1-dustin@howett.net>
In-Reply-To: <20220505151433.2893-1-dustin@howett.net>
From: Dustin Howett <dustin@howett.net>
Date: Mon, 9 May 2022 11:12:56 -0500
Message-ID: <CA+BfgNJePKE=yBRzpMC0V-UmbVn-D2vU2HuDvj0JQ2PiNMukUw@mail.gmail.com>
Subject: Re: [PATCH v1] ALSA: hda/realtek: Add quirk for the Framework Laptop
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, May 5, 2022 at 10:14 AM Dustin L. Howett <dustin@howett.net> wrote:
>
> Some board revisions of the Framework Laptop have an ALC295 and have an
> issue detecting headset microphones. The "dell-headset-multi" fixup
> addresses this issue, but its application requires an end-user or
> distributor to opt in.

The patch in its current form generates two new inputs when a headset
is connected,
"Headset Mic" and "Headphone Mic". While this works, it might be
somewhat annoying.

I'll send out a v2 with a more comprehensive fix.
