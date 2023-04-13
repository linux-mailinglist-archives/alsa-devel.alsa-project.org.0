Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA8D6E0F34
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 15:51:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 853FDF28;
	Thu, 13 Apr 2023 15:50:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 853FDF28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681393866;
	bh=afsP9eR29z8ogXJ4k7X/m1aKljN9d4cNYKZUZO6xrLA=;
	h=From:Date:Subject:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FbNuEdFi4JtNn+b1QcvEQhVhgw2WPS3iLbGwd1WDQSOYD4fOGu/FhjWYf6j0GLRy0
	 +fYF//zLmAuAnn5DUNiDU6Upv2dhemrrWD+U4VkhPGQiiv3y5S+UkRepxeKLW6t6ue
	 2/lCGmIOaOPKvXnwLfrGNxNwk5Y+mOLmDK34ZGH8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 078B4F8023A;
	Thu, 13 Apr 2023 15:50:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C55EF8032B; Thu, 13 Apr 2023 15:50:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02BC8F800E5
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 15:50:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02BC8F800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=L6w5otXI
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-54bfa5e698eso436472767b3.13
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Apr 2023 06:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681393803; x=1683985803;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=me/aMOzykgZd/rQWir4A2t1w//OGU8Q3sKZmPgaxe3w=;
        b=L6w5otXIHyI2IbOVWI9zFAmYPFxav9f5v27dXrrRH5HzftZ+oIBUdCXz/CXcq12RZK
         /uxMw4zvD1cr7CPBX5VkAuLku7Csi2L9kUR8s5hSavTTtFO6c1Q7p8j/IShwjeXZ3/e0
         /6XxUhegy5rZurXznROgvK/yQI1ndV1AdK+/HTneWQlrgs7Sjz8zhnXeQEKoHid1LHWK
         rej8qf/u8enxGMKgKXMT7VcTCYpfuW/0n1bgRZlGK0ry9fPPE+uO/3WL/VgOspLH/+9P
         oAEBBGoTla0VCEK2cx2VuMcjujESdZ9fRkAgT9v1oIj9FapE0mgylJzG1/fU24vEMChx
         pJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681393803; x=1683985803;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=me/aMOzykgZd/rQWir4A2t1w//OGU8Q3sKZmPgaxe3w=;
        b=mIvJDeqc6H2r5ktaKFZ8ezDpVDWAyLGyOgrhupjbTvVDn0yeqdb1hwXbVOx2bMr6F9
         VUBBFJLlRYkV+Gh2H2Vbg50YsdC9C7U+W0ALlxtObt60NBq2iA28ZDUspwWHDLh62DAE
         K/9gYuZsyxzqwFTJGMwp5wC1vdwlfKyaeFL+VbZ0htM+ieg8gK2quHWsJfKOKRj2t92W
         +MkmRmDHUHY/a+WZU/Ni2no8EcEotNElFGfWeGUuwGqSFfyMX7l2zoROU9gvVxwa9zaM
         dRaOZiZZn+8HA7FcwdhfSMy/Jwh4inMzPcExd+MhhTmlOcjtahDVuizrw9rssyZLBisM
         TXKw==
X-Gm-Message-State: AAQBX9cJWDJrCKud+rDsbqitlMpqUHg5OgxwGfV4pFH9ci7VYxAaL070
	sQu93qTkzb2YTsstBTTKcvmch89vcx+G30z9J08JZfqvdOk=
X-Google-Smtp-Source: 
 AKy350abCiWuKt0W2Oza25xh9u6LUaylRn/CALV3kMLCROgnXylFy50rKXHdCamIScI6llmAjIwhKyqMFPANJjviXOY=
X-Received: by 2002:a81:7613:0:b0:54f:b9f8:70ae with SMTP id
 r19-20020a817613000000b0054fb9f870aemr1470541ywc.7.1681393803597; Thu, 13 Apr
 2023 06:50:03 -0700 (PDT)
MIME-Version: 1.0
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Thu, 13 Apr 2023 19:19:52 +0530
Message-ID: 
 <CAHhAz+haVH-4Hgsz0PpTgUSW1pX4XxwxXwEd7nLVb0sFFwQwCg@mail.gmail.com>
Subject: ALSA: arecord : silennce recorded as 0x80
To: alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: M5SDSDKOMDGL6UT22Z4CH5EKBCCWDIKU
X-Message-ID-Hash: M5SDSDKOMDGL6UT22Z4CH5EKBCCWDIKU
X-MailFrom: munisekharrms@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: LKML <linux-kernel@vger.kernel.org>,
 kernelnewbies <kernelnewbies@kernelnewbies.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M5SDSDKOMDGL6UT22Z4CH5EKBCCWDIKU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi all,

I recorded the silence on the default audio card by running "arecord
-d 5 test.wav."

Once it exited, I checked the contents by running "hexdump test.wav,"
and I see that silence is recorded as a sequence of 0x80 instead of
0x00.

0000000 4952 4646 0024 8000 4157 4556 6d66 2074
0000010 0010 0000 0001 0001 1f40 0000 1f40 0000
0000020 0001 0008 6164 6174 0000 8000 8080 8080
0000030 8080 8080 8080 8080 8080 8080 8080 8080
0000040 8080 8080 8080 8080 8080 8080 8080 8080
...

What might be the reason for silence being recorded as 0x80 instead of 0x0?


-- 
Thanks,
Sekhar
