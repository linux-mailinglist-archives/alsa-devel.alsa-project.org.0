Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6CD109432
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Nov 2019 20:27:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEC751752;
	Mon, 25 Nov 2019 20:27:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEC751752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574710075;
	bh=rGi5qEhQZ2m+eyD6NE5OQPU3n/YFEat/4+YRt5uLaT8=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cBFcSx3le8eyola/bXcTJvSYJiUdtwGMP3EUSRwOnsZMwibRHtsDBk89vnnGZYU8x
	 ssTaO6NzRAEkBZ766XNj7N7YGjNMmt8GGJfDfwPOrfZc6Q83mKQRLVZQsArjXDTAFY
	 ZwmR/GBjdMjdZ/7pzyBV1SsK2i0XKDLDFSyqZKDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 915C8F8019B;
	Mon, 25 Nov 2019 20:26:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBD02F8016F; Mon, 25 Nov 2019 20:26:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80F7FF800E5
 for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2019 20:26:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80F7FF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="vTyCBeRY"
Received: by mail-qk1-x741.google.com with SMTP id c124so9439968qkg.0
 for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2019 11:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=9wSVl85P+G+aNB8/iWm7jZgmts7jCsdw5BJIgt7uVPQ=;
 b=vTyCBeRYELnxZC/z8GY8I2L7akIKkmq3FxwmtoQAhbqN/ikENFpiaZPNFj3JKjF+t7
 XWEkEMV3E6NHWLr/tNO/4aHBHillJjKq5F7xgbJsfRUg7DIW+4GSkOjHlvJdV0EY2AVk
 vt0Ajb4/zP1TZaVwpnIYJ4noTwb6111Xk4DypTUMPnH8pvLmfz2kgS7aC5mZzSQqtILy
 Nwnjr1OhVjaJab/KIieH+6U5c2fKXBiZ72OLHYo+0rwhG5rAZUIyoii2PCUXI6A34gZu
 HIWNZeGfe4oNhHUQxs0o/r6x6l5S6afP7vP0haCtS8gJIM5pAEAXCFqDsHJeNHYwCsJq
 mtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=9wSVl85P+G+aNB8/iWm7jZgmts7jCsdw5BJIgt7uVPQ=;
 b=ovT4QPbVOJAwnEqHySM/R58wBiKb701Pul9QpqCbb4feUoix2kByT5p27hW9hH29O4
 qZ7rv5l2WW9Q4l9U3w2CwgyP9q1ZLh7u+/ZWrK/yZvxqCXTlMl9yuqAeXtO2yKs6Msuh
 l6KeH/QvYCvUiGi+jia2SNA84/71rq0i76zxyR6BdZvYdF/CgX0iM2A66dA3TGfVjcRB
 6dhWDbvbMrOpnUNsD+U1rAIP3bcEQ/s76o/1croWO0YBK34bvg9Zn6/nJ77KYFndlrY8
 pr/JG1dv32DWrm/zgS7NmI3PURAKIin7llPOcAbe4L7kLehjF/EX7SzVQ0hhL6FhwtE0
 CD7Q==
X-Gm-Message-State: APjAAAWJNy//q5BICSXJ3Aqq8mbdGoPI/qG6T5BCumPVvB+mRa3soYaI
 kPp5HynEzPrA49higHWPzmf3NnLiz6J/RcDG/F5ToYlL
X-Google-Smtp-Source: APXvYqxyjkOPNCmVrMF8eVq/PIwcBfd9awRD2vWLY4LNOYli7D30uPz2FvnppW5nFc+byiL4QZBEgIK/Ah6ScRHK/4k=
X-Received: by 2002:a37:a914:: with SMTP id s20mr27063516qke.92.1574709963948; 
 Mon, 25 Nov 2019 11:26:03 -0800 (PST)
MIME-Version: 1.0
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 25 Nov 2019 11:25:53 -0800
Message-ID: <CAOReqxjFaWhYCzzyZ90Pc5EvzUky6kCYqakz2XBwSOii9d3maA@mail.gmail.com>
To: ALSA development <alsa-devel@alsa-project.org>
Cc: Dylan Reid <dgreid@google.com>, Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: [alsa-devel] Headset button mapping in the kernel
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

Hello ALSA Devs,

I am looking to get some feedback/ideas on a possible change to
headset button mapping. Locally we are carrying patches that implement
the mappings in the machine driver (which we understand you do not
want upstream.) We are looking to see if we can add a new API
(something like a sysfs path potentially) to have userspace pass in
the mapping, if it chooses to, so the mapping can still be done in the
kernel. That way we can carry just the config locally and remove some
of the kernel patches we are carrying locally. Thanks.

Curtis
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
