Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAA76ED0CC
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Apr 2023 16:58:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FB90F2D;
	Mon, 24 Apr 2023 16:57:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FB90F2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682348282;
	bh=jtkDVmdLDFIKgsp0YNlPgC/wM/63IRAQqD09QHNqHT8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PCuVfNm61J3HWMpaZrN9XJBCQVeoMOEMaBUWn/TYsGImXF1hzTrq0+0cpP8C3Zxwv
	 D3qIwIShCzMsrsYb/2IwPbozXLY0WYSJeyXqbvTvq6V2ulU5Zu25LnBG2N19G/YiAL
	 A51dQfpkSKYZ0Ztn6CNEkFHNHHjijhAEXgoMt8Dk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1CBCF8018A;
	Mon, 24 Apr 2023 16:57:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68CBAF8018A; Mon, 24 Apr 2023 16:57:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE8C7F80137;
	Mon, 24 Apr 2023 16:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE8C7F80137
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=KnkvuDUv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1682348198; i=markus.elfring@web.de;
	bh=jtkDVmdLDFIKgsp0YNlPgC/wM/63IRAQqD09QHNqHT8=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KnkvuDUvyAkbuyl7wtmk4a68ZnRcbYjRrIvKdbHQvyZcLiHFMoS2GawCu4XkeI+Ie
	 FWfoLGh6P5/867/Jg3BFC6y3LKNF4NfcxqEd8CX0TxvYppRiwGsJpcxaQhhOj0hzog
	 bYWe3Pcy3DP5MiTy/+Uo7XlabkIZnoMhvIIuGCUFNo06/cA5vJyP7kulZPMdWzwyzG
	 4nZsB4ZbNcKd2F+JpIY9/7iCKv2MpcYabWatVWcNM3IlItvNlhOoaYRE/EyUEeGyUo
	 TmeRGfuniq2/mQcbm0ZV32CDSm8U3/soh/DL7mYiNsG9ws7PbLeO56fFZNSvI6l8N7
	 l0japGPM7iCDA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MgRMB-1qVE7d2ueV-00hS8E; Mon, 24
 Apr 2023 16:56:38 +0200
Message-ID: <801aecdc-72ba-b3eb-dc7f-4399c088c60c@web.de>
Date: Mon, 24 Apr 2023 16:56:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-stream: Move three variable
 assignments behind condition checks in hda_dsp_iccmax_stream_hw_params()
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org,
 sound-open-firmware@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <c18331ca-3de9-d433-f477-b04103958b9c@web.de>
 <fbdee94e-b731-0471-e18f-b334ab0db7f5@linux.intel.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <fbdee94e-b731-0471-e18f-b334ab0db7f5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UnK0rUvKC1Pk9JiB/V5fR4RvTmP+1z/CDc0w5EEuY+1RjWp/iAA
 Z+/Kb0zUbJCD4z2hceZ2Iv939MQ/AMp009ywOEcPdRAUWtFdPeUlVTkKHRrPJ4ehzLq2YuK
 W3qsniM0IDjgO9uBOwsApR99ytwVLDXvRYzLIihdkFu9bRzoxECOsvIlAJar47Qz07kg80f
 ymL7nBdXdMku73Xz6L0hw==
UI-OutboundReport: notjunk:1;M01:P0:oHWKBFsbJOQ=;Q+gxQQVOZ2AbqV/7gri2YaNHHOy
 +uLrThMcG2eiORJuV8TXWo9nOFa7+VNPb7Fd9P5y/+Tl/SSmvzgvQtl3TYrmmXPXkc08RafSa
 s5PXXLaJRxyMP4NC2w0yV1SZvwDhZ9xpB3otj+aaLqmCYTmtNKQcJOfvYTZAFxUGkOD/x7cI1
 NT0XeBWXRvOPVswgGqVok8a91hkXOZwGjZkUknPOkUkgTP3D5J3I/oDP8hc391kCn0UXoRkzh
 YavFMLbbVnd47PpXQaCDuogJXG+t2bSmFk5Z/zPPsmB2ulLa6l/tl1NM5OR/5yeyuW1ki4FWY
 V6yaRqDqW/X39UQtIyyOYRPWwhSfJ6sniC9ibZ45D9N1vWxbRX/h8oXNG5nZN0kzVNVUxLHZA
 XCKXKoF9uQcN5sYHHCG9gbFGpktihlkTIYO8Xwny1AJD+MAAoQvhIyDn3kh1Bob52wjrNZeAG
 I/AKEbro2jn9Mr9ePx2NQOC/fkTCH7rF+omnZJsiZCk6/BkI4/k8ztATaFlzgEPDGSSPGL0xD
 rJFXtxh8e3kFb9sB3BTpzbwZkBdJZ3Jm9+T63edL4L7TK99tJQWEMN9JuYsjf0Nl0Qxfl4dFY
 /NsBq2/mFjL/BwKaK9gVUqVhno5pVnwaU83fifwcl/uIoQQI3sEOkz2r+ICEGXl6v1yp5iNEs
 1ZdHWKog8IQIlTnNPhXwuGPpVgHprAY1aPeR41meMzzbP/RoAGiHI87de7lwaAQyWiNmsb4r1
 9Ty8jGOfWLQZi87DyzjrDtrW2/FxWPEaQmKEzBlx1byehSIJ9RFIdYmRgg4IqN3AKKTv/Cr7I
 fBccbbHPyiBtEX5wSCVfCBnIDmjjlBugrvUewpGkDYu9ZKq6qtx7sms7H6hYeG/tnKMQsm8FZ
 z2cg5J5WgwfwZjRO2U3JlfFVe6Akdj4INPkXD69x7lRjJZgPbrWPUfVJ1bPFcchxh4iSHyuXV
 2x8PXQ==
Message-ID-Hash: CBQ5AYOVV5JTQCJISGBBPMMWJ47MBQ36
X-Message-ID-Hash: CBQ5AYOVV5JTQCJISGBBPMMWJ47MBQ36
X-MailFrom: Markus.Elfring@web.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CBQ5AYOVV5JTQCJISGBBPMMWJ47MBQ36/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>> The address of a data structure member was determined before
>> a corresponding null pointer check in the implementation of
>> the function =E2=80=9Chda_dsp_iccmax_stream_hw_params=E2=80=9D.
>>
>> Thus avoid the risk for undefined behaviour by moving the assignment
>> for three local variables behind some condition checks.
>>
>> This issue was detected by using the Coccinelle software.
>>
>> Fixes: 7d88b9608142f95ccdd3dfb190da4a5faddb1cc7 ("ASoC: SOF: Intel: hda=
c_ext_stream: consistent prefixes for variables/members")
>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>
> Yes indeed, for some reason this was fixed in
> hda_dsp_stream_hw_params() but not in the
> hda_dsp_iccmax_stream_hw_params() variant.

Would Peter Ujfalusi like to support similar source code adjustments
also according to his commit 09255c7ed8ca1f1ed99357b845d2f63fe2ef3e1e
("ASoC: SOF: Intel: hda-stream: Do not dereference hstream until it is saf=
e")
from 2023-04-04?


> Could we however use the same code as in hda_dsp_stream_hw_params() for =
consistency?
=E2=80=A6
> 	hstream =3D &hext_stream->hstream;
> 	sd_offset =3D SOF_STREAM_SD_OFFSET(hstream);
> 	mask =3D BIT(hstream->index);

Can it matter to move such assignment statements a bit closer to subsequen=
t statements?

Regards,
Markus
