Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C7882C01
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 08:48:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB8F8166E;
	Tue,  6 Aug 2019 08:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB8F8166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565074107;
	bh=7ruW9vuzqQhpn3lPvitLg3pGmmnU3TW6VGeCJ0hOsQY=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oBUNJ9bxI7mgYPH04+wNSBAOrOierDCuULCNIiNa6WwMkt86Tmz1gne4n5E2Vltyt
	 PmBhhPuU6ZtwtcN1+anicKm51K78Akzubiqw0qQZKWC4AxpJbvSJt57Y4wZ9yYi/qd
	 4LhcHAD04b0f7/I2qWVJQbVxcVDhOmt6xSD2T+rc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27C7DF80290;
	Tue,  6 Aug 2019 08:46:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D609F80534; Mon,  5 Aug 2019 19:14:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA138F800F3
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 19:14:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA138F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HGT9ZcCF"
Received: by mail-lj1-x235.google.com with SMTP id p17so79943573ljg.1
 for <alsa-devel@alsa-project.org>; Mon, 05 Aug 2019 10:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=3xsQ74qKv3UuFS10A9bUgl7REaf0Fg1Nv+YPib/qLJo=;
 b=HGT9ZcCFxjXpgI1x7KEu3xLwPbEFi6gfI64dWUqWyYqocH3X37vKNxoZlER3fGaze1
 AFQr33tZEhd5RW3cPnRkNM1JNh+7Q2r0ei9O843Jq1iADeSHw1DfLaMJEW6sYJI7KVA6
 ijhuUrzZb0QPY02NDpJIrQEbh8KGh5iaHwLUSeax2Db04X4omO/abEm1D4z9AIFPwMdR
 5U0WgcSMatZrJSXHDaj2S0MzkBV7omJsklTjZ7D8pS1ebGpOELmyLceZcaDQy7Jpszyy
 G9oRKluwm57kEb8GcR59tHk4d/1PMAhBcXW0PxA1g3ccyc+nHj0VKGXAYUQaX7E0mWQA
 l0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=3xsQ74qKv3UuFS10A9bUgl7REaf0Fg1Nv+YPib/qLJo=;
 b=V2OmnCnD8kv7s9/ziWpbWMt8OCfGrHmpZOR4aH01hleSn21XYMjIKanG7qVydc8Qv0
 QVM3RUWnp0EMZ8Wy4Nzm4ZWVtp8HYQFTVIxFscXSATS8S4EQHXYcX7m0zJw889jtKgU1
 nzbDSmspJl9v6J3d+SeZODi/90ng46MFlW6wRdZf3vbP4Ugbl91MVvwbYG/eILZmJo8t
 JY3J/j7NI4P5n8DdDePE44NGjHDgQanDmgV4jC8j679MXTc3kAOYsRXtKz6xlymoSLw1
 PWOc2YzctIvvs2dMpCgLorXttNBjcmvbvrV/qhjV/0cLk5+QDOEA7JnS9ciq0VyBCOs+
 EQgA==
X-Gm-Message-State: APjAAAVrRajfT3GGObbd7huUciAjtMgQxqpd7Qwf8cuGYRpAHW8lLedA
 kenAPeXlpHMuzhG7wchLtRvqVIxs1j8xqPw5KG/7Aw==
X-Google-Smtp-Source: APXvYqzUl1S2+u2opjgvNoc/bIss/iJ++NEL3QwaYjhY8jtVVcdGeDkbliNrgX19gR+hL7t46Bjw4omGRZ+zFFXbEjM=
X-Received: by 2002:a2e:93c8:: with SMTP id p8mr29537287ljh.6.1565025280283;
 Mon, 05 Aug 2019 10:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAM+cExGffwFD7U--tZqd_PxFwgdy6YA_tZHvw6B3au9KNygEhA@mail.gmail.com>
In-Reply-To: <CAM+cExGffwFD7U--tZqd_PxFwgdy6YA_tZHvw6B3au9KNygEhA@mail.gmail.com>
From: karina filer <kafiler0911@gmail.com>
Date: Mon, 5 Aug 2019 22:44:25 +0530
Message-ID: <CAM+cExEBpgWctFLKcVej9UnLS2VVx9CoaOigu9y3BvYGNOi1zA@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Tue, 06 Aug 2019 08:46:41 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Alsa-Plugin 1.0.25 License
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

Hi Team,

Greetings !!

I am facing difficulty to understand the Alsa-Plugin Licensing, Could you
please help me to make understand?, Is it under GPL 2.0 or LGPL 2.1 because
after extracting the folder I can see 2 copying file one for GPL and other
for LGPL.

https://repology.org/project/alsa-plugins/packages


Regards
K. Filer
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
