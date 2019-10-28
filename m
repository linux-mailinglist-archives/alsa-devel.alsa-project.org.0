Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A68E6DF6
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 09:21:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A1881EF7;
	Mon, 28 Oct 2019 09:20:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A1881EF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572250898;
	bh=WXBP8oJgpbEwQ1e0e1iDVVk96ng/ZcbHF2tYgv+zG98=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uluqYafQ2+/r0YQJvbU856Mzb8yCp6ZAyt8Si/r3s2dpj/cvZ51PIAO22FJQV0w9G
	 JJ1xmSkGfbT/eLndlDFInMxKdWYup16Qi2aHHGUjS2jobNO5NSB+qeAieA590pgMqA
	 O6i4LNyA3FGojCTg9AzXP8ptklRUdFCbafZ9oPEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0EA2F8044A;
	Mon, 28 Oct 2019 09:19:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CBCBF80361; Mon, 28 Oct 2019 09:19:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE, 
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.web.de (mout.web.de [212.227.15.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E41ECF80145
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 09:19:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E41ECF80145
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="YzCgp4VW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1572250776;
 bh=QtnCetD729xeNeitMUa344p4nNWm9LknsZvUvsKn3DY=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
 b=YzCgp4VWfIPsl/BqIGVcoOSIncJSwGrJ9tfwkvMClXzbn0mDVe3xM9WV5Vxuta09f
 VMj4JUXe+jDrwtpEYtU2+wYdBQmnOhXZVlnBYyIwD2d7BdP0n+l52VAJ8U3L/0CIUp
 1Rt/eIdLTpoC7T1xDbQWwF1xc419KyrfLUSZ22tc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.155.234]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MfqC4-1ibBTY2pZU-00N7T4; Mon, 28
 Oct 2019 09:19:36 +0100
From: Markus Elfring <Markus.Elfring@web.de>
To: Navid Emamdoost <navid.emamdoost@gmail.com>, alsa-devel@alsa-project.org
References: <20191027191206.30820-1-navid.emamdoost@gmail.com>
 <47c90b48-8706-7860-3b87-30a7bbb726c0@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <49777a3b-1fbf-06e4-b4b0-856105c86852@web.de>
Date: Mon, 28 Oct 2019 09:19:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <47c90b48-8706-7860-3b87-30a7bbb726c0@web.de>
Content-Language: en-US
X-Provags-ID: V03:K1:EMbUgTQTVUTuX2M+l3nSZ1pKXOm265SWv4pSxyXfxdSNZsAHDyk
 Mw/9iP6ftBUtI/AC0vMLlNhNuff3GL95ubGkAlYmIZReI6I6ueKAcuf8qYo+E621y7Kh0H/
 ppeWSrZgYzlFW/OdcoXtpLNkf/KISIbg1eOQNndDCPtegIdj2UpTVNZ4cFr8fBV9e5ua9fX
 HIWWc71GW1vozeJrQupKQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G/OxIW1A5Qs=:FLYggwabgPNNyYUqr9PfVu
 AmayUGjx9DQKfzaUJVHwfbq1rFUIYeoexWaeQ4H4M+9lk1FDSZQlFLKFsENR4WQZV/cxu0b8E
 Q2H//QJK+NjDJbJIc8oKpB6FEYZzid9LWGDwHPKmf+HLT3Gx37eN6vzRyIfS1AF8EkSxYSd5Z
 P33Vi0zB6HApUcPCKz6XjVz7EGPUmFdz7Uf4aRvXnAh8GeNGsoaPCdcNysOPAhW7/FqZvmFnC
 qDUo5oYPrjg8eNj9lAukxIwVreqghen3zGapS64DIfmLjhJoVv8pjEqBv1JpJBRk7/GdVBKcr
 5V2T2EHGOmUC8gdmAMuYwStTwRMSU58Rup/+/6JgFvfx26PmS5V847ADT+DnHr9ZCBlLhOLkl
 kmwe9HIwObFJcuzzeNJGWZn01KAdEYABTDcbhXocnjEqMUoOYTnl1Nn+ZllwdzEHy4JdPqzcM
 ohPObiMGFLJkhHe6BvVTxSg5zLG8dRoop4amcEmbtD3cf0zL9vzT7Z2ITr69JakDWaUCsgi++
 qzEql6vkQAb72p+z18FFLNGM8Az4ff2bvU/9HH9+pZmqVHA+FiJUarjxvbPFniXydwsr5Giy8
 zLVluJrw5/kQELClFrnhJn5NcabfRHe8dFHIQYaMXo8FXqkjtKiMWxwdZAb3DRprpfQw/ihIz
 rXHMtbBPapXwO4GQYwknEB0JgkBHMJZsr6en0uWJaSk0p5QZBQamcjxscCmVJXkFzhafTkIr/
 Sr8XeES0uDC5hS3STwnRtB/tkvSK0QzJX6oWhiU3SfXZSHaJQ5SXleGBXWKoT3+i35hdaGPxG
 3nAunCZ0j11uZVLoF7UIefg55RlI57Il77ZigZ9nZiL8fh7P1B8UCPM8JoV7gj/h9Kld1IJSZ
 LkZf0+SHTRHu96w93ZU/sad1lNBkcSbqCUvtaPRAVSKHK/OPNpUvmb4vSS/5dkKTRCxqCSjHq
 J9bR3KyLxEHYPTFgIROLOCgBLNVBrPq3bP3cRdpZyLZodIriNgmzReGPmYG2OFRORldbsmA2y
 SXRzZo9kpoOiLpIUczxqhstjw4Fb/dc6Qu3FRuX4dAkN4GxgRYEgckqsXkBbA5nujIt8QTs5J
 lPAGTYDMirUVbmvTUfSnQlGYOzOzFwUyQrwKGWmWFDdXEC+pcB8XD318RWM2MVn8PYEM4bGNl
 +ROQTk3r9FNaNTUicYYsKdw2ISC4La6Y4OoZFI+fGiHeKr6RyXwjbok1A1DbAHg6D/84Al6sC
 06ekspYSo8iy1fUrfAjr+/Tq2lTfo5um8sy7vmse2SCJsN/Uu3Xjqou10ar8=
Cc: kernel-janitors@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kangjie Lu <kjlu@umn.edu>,
 Takashi Iwai <tiwai@suse.com>, Richard Fontana <rfontana@redhat.com>,
 Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>,
 Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] ALSA: pci: Fix memory leak in snd_korg1212_create
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

PiBJIHN1Z2dlc3QgdG8gYWRkIGEganVtcCB0YXJnZXQgYWNjb3JkaW5nIHRvIHRoZSBMaW51eCBj
b2Rpbmcgc3R5bGUKPiBzbyB0aGF0IGR1cGxpY2F0ZSBleGNlcHRpb24gaGFuZGxpbmcgY29kZSBj
YW4gYmUgcmVkdWNlZC4KCkRvIHlvdSBmaW5kIGFueSBpbmZvcm1hdGlvbiBpbnRlcmVzdGluZyBm
cm9tIHRoZSB1cGRhdGUgc3VnZ2VzdGlvbgrigJxBTFNBOiBrb3JnMTIxMjogVXNlIGNvbW1vbiBl
cnJvciBoYW5kbGluZyBjb2RlIGluIHR3byBmdW5jdGlvbnPigJ0/Cmh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2Fsc2EtZGV2ZWwvMjE2NTY2NmMtNjlmOS1jNzE2LThlZTgtZjUwNzFhNDFmMzdkQHVz
ZXJzLnNvdXJjZWZvcmdlLm5ldC8KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3Bh
dGNoLzg1MTcyMy8KaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTcvMTEvMTYvMTkzCgpSZWdhcmRz
LApNYXJrdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
QWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBz
Oi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
