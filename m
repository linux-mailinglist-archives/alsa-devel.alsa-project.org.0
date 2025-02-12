Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E287A37F80
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2025 11:11:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64ECE601EB;
	Mon, 17 Feb 2025 11:11:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64ECE601EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739787091;
	bh=boClx4IF2tcO2bse+Jt947bNQRtnchIbxegz9HK1K7I=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rFBqNtMYqFQPuzSH+J/JpgRz1kNuoWck5KgDJL61dXWD14ksFNaxx0iP3LfdAhyV+
	 yB+TCwAP8lgnpmqaue5gYm2MSNtiC8feBRy0GshgOqxZ+/SGnTfyjU33m6+yVnLg23
	 HX56X0bmy+DO8xRr0YuvAdlgRGLinKPqJ+e14ibg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 414D8F80654; Mon, 17 Feb 2025 11:09:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD7E0F80634;
	Mon, 17 Feb 2025 11:09:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CE57F8051F; Wed, 12 Feb 2025 20:05:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E34EEF8020D
	for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2025 20:05:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E34EEF8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=E6ix6k15
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ab7c07e8b9bso23252666b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Feb 2025 11:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739387114; x=1739991914;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FNC2Wi9jRZBfL5ul268VEZxfQqtvCEzpUWJGvGmpJE4=;
        b=E6ix6k15mcwMn9EemJm2KlG2juS+UJZ6+HV9dz2f0ixYr/yuVVHvqeCLwnfxN1aHlb
         L4NodQdLwrOgIZA5gzjToziiRYM+dFPgaWXRE+e7o5wpoVgTtWoVvE93M3iUpS28ENVI
         zFe/Gk6TswgwRB2TFI4hPhn6ouI5iFb6dkLqX/W46YjXbVGzfQnTXypjMZ3HA7Znd0M4
         ixkyjcAxMPC0aSCrWihW0JQ8jTKlVD8cFkTVoOxneS+nnxkfnC56dHqrAt5w4qLBXKhP
         u0pMVlpXhWhfpHdwEk3D7bVFHspwnF/A9S3/uc5SEQZgNMh4zfA5F105aGy3EGN98Qns
         ey4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739387114; x=1739991914;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FNC2Wi9jRZBfL5ul268VEZxfQqtvCEzpUWJGvGmpJE4=;
        b=Jjh4Rsy5bSP57EXOKG9acikGgO1rK3jygXzAQKXlR9Vzj39foON3kbf8gix2hRAkoK
         pG3w71qB1alflVA964Qls8s7UozZ2ip07GZDU1MNcU/qmW2CQHQJ/G6ueVTFi9/5kHPd
         40gSvDExLeRhd0yZGdC9yxKbY2pSRGTqeNzZLwnPFQxHL4Z6PvUxswDC9NtPftNcFvar
         lwis/MKiySzVPP3JlaU/0rM2NWVxUlTkRoBdodxeX3xLOGQguLmlUVkwvpp9GBmhfP2N
         NOj1Al5VgUF4f6sytL0V+6CUaxnyCEtR8UpWjR9cpC4NpYP+ds5Ctj6HP7GG6iUUhqeL
         loHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuRqWNq+ISkz4jEMiUY6Ct3znzbHR76S+YWBNmX/V7NBVZrUBikTkE68s01DlqRoPw4wfoQxCZQIWF@alsa-project.org
X-Gm-Message-State: AOJu0Yy49L+tf/Dat2Zoyx2W6jksCcFKYCueKpx4yqaQIb/wi1oLfwpz
	IS/BzKWiLWJOBFUud6WEW4HooOUDTM09aaG8Eov7TcqhFvVQz9qiPk/oj2EM88xJylfZuRoh8IO
	R1KNXQUnApYMrCBlxn6yvplaPV84=
X-Gm-Gg: ASbGncvDLA69sbq4+rWMAvtWQSDdpnfG2jznXUsLXuORYUKXvCk0mTDv1W5HWOKejKk
	XUspSfdIQ302Tmc3+D4Kvi5RYweuoc9nIvrxy3fmjnZGnLyHN4F9kgi2rNLPB0JN9veUdx2/H/o
	1vQJXJP+uR5uT7IGhBzGP7pHnVCun0
X-Google-Smtp-Source: 
 AGHT+IG/9AA6698yW/Bzw1PQxoSD53kHz7itT7ad5dl2PefX6H2P/O8DgTd6Q3CH8FC0+MjFqL/ELv6Ia5uSwl911d4=
X-Received: by 2002:a17:907:9720:b0:ab7:ee22:391 with SMTP id
 a640c23a62f3a-ab7f34af303mr457659266b.37.1739387114218; Wed, 12 Feb 2025
 11:05:14 -0800 (PST)
MIME-Version: 1.0
From: Dennis Babcock <statoshinakomotod@gmail.com>
Date: Wed, 12 Feb 2025 13:05:02 -0600
X-Gm-Features: AWEUYZnF4KB2h3WwodXTRG3j7vNdNLfbH9YnGQtmEtf3oGrt8xwqTu7j0zfi9os
Message-ID: 
 <CAG6nTanKBXvpWNvi3uMDGphY=zgzFEyKVd-wTtguiEOcqBhuog@mail.gmail.com>
Subject: Re: [PATCH v14 29/53] usb: host: xhci-plat: Set XHCI max interrupters
 if property is present
To: quic_wcheng@quicinc.com
Cc: Thinh.Nguyen@synopsys.com, alsa-devel@alsa-project.org,
	andersson@kernel.org, bgoswami@quicinc.com, broonie@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org, konrad.dybcio@linaro.org,
	krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org, mathias.nyman@intel.com, perex@perex.cz,
	robh+dt@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com
X-MailFrom: statoshinakomotod@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6H7CCR6HZOON7B4WRF7XWRYNDCWF7HPF
X-Message-ID-Hash: 6H7CCR6HZOON7B4WRF7XWRYNDCWF7HPF
X-Mailman-Approved-At: Mon, 17 Feb 2025 10:09:05 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6H7CCR6HZOON7B4WRF7XWRYNDCWF7HPF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkNCkRlbm5pcyBMb3VpcyBCYWJjb2NrIGpyDQo=
