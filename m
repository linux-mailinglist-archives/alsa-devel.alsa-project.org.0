Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5E0358124
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 12:51:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 630F11687;
	Thu,  8 Apr 2021 12:50:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 630F11687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617879089;
	bh=0cRcylPPn2QcrIOpA86R3xKbIOHLniR4zrJOcedlJkE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fMArasEldon+SccjP0XwkMLBj/ww0ZXeHkVuVZMZ5h+8tp7A0Mj8JpffZlEr4CRcY
	 q01Zf7ghIxFS+GqF50GwA1/TtMTsELCtkl1RDmCvj6B1eP84ykShbOCS+OjEiGRT9a
	 9ZP5KA9+Kr8f/MKqo5dkQb7VxChjGNs8Q+uTfMnc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F60CF80259;
	Thu,  8 Apr 2021 12:50:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07A13F80249; Thu,  8 Apr 2021 12:50:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD990F80162
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 12:50:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD990F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="oVb704Jw"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="fjXF81XF"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D1AD25C00EA;
 Thu,  8 Apr 2021 06:50:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 08 Apr 2021 06:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=LYOhuqsZqvF/KarKZYJBiX03XS6
 VJNwRwKGGeCgoPTk=; b=oVb704JwE/GIvjWhmPl2K7+AW1w7j+8fsxIrSnLVbWT
 o3RGBETHuE+xbViUS8hunIFXwxkxaLfKBBLgbQEiHkDDSSms7LzYOxQ/0giGoOFz
 4h1JY0Dst19m2kkFyjNEdE99DyqWdqO7GW4Rbf5DInuIrUVi+TRL0BB56yazM3d3
 maE3sKbvAY/6F8PnY+eDL4M+kA/fp0cr17cVboEO3i3whhMVXDX1jK4NMEiD0b5P
 PgSS54IM6sMP8mNGP/kU8e+VW4OWjqziZHiX1G+vZpsHydvpg8kw+xq6dtPFsSZe
 Aak3Iltnbih5JOYQ5ye069HDKdsppvW+zUMJ6jfscWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LYOhuq
 sZqvF/KarKZYJBiX03XS6VJNwRwKGGeCgoPTk=; b=fjXF81XFPb0wfKAqSkmjs7
 BwUk2FNAk5r6Wyt2z24d0rIgQKu+xt/Dm8xsSuqbGm0i3CYN0XTkCA4eJJsJIABg
 ZRK5maQ6ZmfOBXlcCk5b/CCgd+OEmOSwq0FFOj51De1P6eaP+fsey0fbM4PQYByr
 8igzm/IUQD0p3mh96SYgkIh4m/w9lyphVa3xDeIrlGA79DSZVw3A7UO/zRcdzgAX
 zI2Co2FJf8CyEmxYfC5sGzN2qRUNZ9LKVJxiC8GOpdYoSRVqeeycqjk93uR/mmiO
 I3P6XVU7nNEcFLpfmHxTWQDhLlfqLaXsTCObTq4a59PHTos0PPopDVjZYVTs2XCA
 ==
X-ME-Sender: <xms:9N9uYOTE2KQ3TYmCM8J659uN6SZfB-1UPyDdZmAM9SCav7ucZo4EOQ>
 <xme:9N9uYDzJVnNs1en_9B7tjkh9Hi1VFhVqZLAoqgBiKWw8APj01bZwA1iVfe4a-X7hI
 t_REExi4vh2LaPinC8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejledgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepkeehgffgve
 dtffehfeetgeevveeikefgieekhedtleetiefghedufeeifeelveevnecuffhomhgrihhn
 pegtrghrugdrnhgvfidpvghlvghmihhnfhhordhnvgifpdgvlhgvmhgrtggtvghsshhflh
 grghdrrhgvrggupdgvlhgvmhhiugdrnhgvfidprghlshgrqdhprhhojhgvtghtrdhorhhg
 pdhgihhthhhusgdrtghomhenucfkphepudegrdefrdeihedrudejheenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:9N9uYL3ub5dio2GGdod5MYixORH9_9_yW_0LO6dViQnyadzl0n9ShA>
 <xmx:9N9uYKDgRUza_30E2-A9n0Q_X0xURNa6O0cso_q5QLVy387131uZLA>
 <xmx:9N9uYHgoVFHqo0JUh8SGsul1z-RlkufDefWxsXrMJhZzE1jySqeEfw>
 <xmx:9N9uYJdnnI6dXwnttU6Jk8jYxfKlMAqYOeYtrkFW8IbQaql05Frr2A>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id E5B111080063;
 Thu,  8 Apr 2021 06:50:27 -0400 (EDT)
Date: Thu, 8 Apr 2021 19:50:25 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: Re: [PATCH v3] ALSA: control: Add memory consumption limit to user
 controls
Message-ID: <20210408105025.GB40407@workstation>
Mail-Followup-To: tiwai@suse.de, alsa-devel@alsa-project.org
References: <20210408103149.40357-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408103149.40357-1-o-takashi@sakamocchi.jp>
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

Hi,

Some supplements.

On Thu, Apr 08, 2021 at 07:31:49PM +0900, Takashi Sakamoto wrote:
> ALSA control interface allows users to add arbitrary control elements
> (called "user controls" or "user elements"), and its resource usage is
> limited just by the max number of control sets (currently 32).  This
> limit, however, is quite loose: each allocation of control set may
> have 1028 elements, and each element may have up to 512 bytes (ILP32) or
> 1024 bytes (LP64) of value data. Moreover, each control set may contain
> the enum strings and TLV data, which can be up to 64kB and 128kB,
> respectively.  Totally, the whole memory consumption may go over 38MB --
> it's quite large, and we'd rather like to reduce the size.
> 
> OTOH, there have been other requests even to increase the max number
> of user elements; e.g. ALSA firewire stack require the more user
> controls, hence we want to raise the bar, too.
> 
> For satisfying both requirements, this patch changes the management of
> user controls: instead of setting the upper limit of the number of
> user controls, we check the actual memory allocation size and set the
> upper limit of the total allocation in bytes.  As long as the memory
> consumption stays below the limit, more user controls are allowed than
> the current limit 32. At the same time, we set the lower limit (8MB)
> as default than the current theoretical limit, in order to lower the
> risk of DoS.
> 
> As a compromise for lowering the default limit, now the actual memory
> limit is defined as a module option, 'max_user_ctl_alloc_size', so that
> user can increase/decrease the limit if really needed, too.
> 
> Co-developed-by: Takashi Iwai <tiwai@suse.de>
> Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Tested-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
> v1->v2: Drop alloc_size field from user_element, calculate at private_free
> v2->v3: Rebase. Fix boundary error. Obsolete macro usage relying on modern
>         compiler optimization. Change comment style by modern coding
>         convention. Rename module parameter so that users get it easily.
>         Patch comment improvements.
> ---
>  include/sound/core.h |  2 +-
>  sound/core/control.c | 75 ++++++++++++++++++++++++++++++--------------
>  2 files changed, 52 insertions(+), 25 deletions(-)

The original content of patch comes from Iwai-san[1]. I have no clear
idea to handle the case so add 'Co-developed-by' tag to the patch. If
this is not good, I apologize the lack of my understanding to the
development process in Linux kernel.

In this v3 patch, I add below changes to v2 patch:

 * Rebase to current HEAD of for-next branch (884c7094a272).
 * Fix boundary error.
   * Original patch uses 'bigger-or-equal' to max allocation size
 * Obsolete macro usage relying on modern compiler optimization
   * this seems to be friendry to any static code analyzer
 * Change comment style by modern coding convention
   * '//' is acceptable and friendry to any static code analyzer
 * Rename module parameter so that users get it easily.
   * The name with enough length makes users to get it easily
 * Patch comment improvements.
   * Some explanations are not necessarily correct

I did test this patch by with below script, written with alsa-gobject[2].

```
#!/usr/bin/env python3

from sys import argv, exit
from re import match
import gi
gi.require_version('ALSACtl', '0.0')
from gi.repository import ALSACtl

if len(argv) < 2:
    print('One argument is required for card numeric ID.')
    exit(1)
card_id = int(argv[1])

card = ALSACtl.Card.new()
card.open(card_id, 0)

# Retrieve current value.
curr_cap = 0
with open('/sys/module/snd/parameters/max_user_ctl_alloc_size', 'r') as f:
    buf = f.read()
    curr_cap = int(buf)
print('current value of max_user_ctl_alloc_size:', curr_cap)

# Constants.
BYTES_PER_USET_ELEMENT_STRUCT = 320
BYTES_PER_ELEM_VALUE_ENUMERATED = 4
VALUE_COUNT = 128


def user_elem_size(elem_count, label_consumption, tlv_consumption):
    return ((BYTES_PER_USET_ELEMENT_STRUCT + elem_count *
             BYTES_PER_ELEM_VALUE_ENUMERATED * VALUE_COUNT) +
            label_consumption + tlv_consumption)


def calculate_expected_iteration(elem_count, label_consumption,
                                 tlv_consumption, curr_cap):
    expected_iteration = 0

    consumption = 0
    while True:
        allocation = user_elem_size(elem_count, label_consumption,
                                    tlv_consumption)
        if consumption + allocation > curr_cap:
            break
        consumption += allocation
        expected_iteration += 1

    return expected_iteration


def test_allocation(card, elem_count, curr_cap):
    labels = (
        'Opinion is the medium ',
        'between knowledge and ',
        'ignorance.',
        'Rhythm and harmony ',
        'find their way into the ',
        'inward places of the soul.',
    )
    label_consumption = 0
    for label in labels:
        label_consumption += len(label) + 1

    tlv_cntr = [0] * 24
    tlv_consumption = len(tlv_cntr) * 4

    expected_iteration = calculate_expected_iteration(
            elem_count,
            label_consumption,
            tlv_consumption,
            curr_cap)

    elem_info = ALSACtl.ElemInfo.new(ALSACtl.ElemType.ENUMERATED)
    elem_info.set_enum_data(labels)
    access = (ALSACtl.ElemAccessFlag.READ |
              ALSACtl.ElemAccessFlag.TLV_READ |
              ALSACtl.ElemAccessFlag.TLV_WRITE)
    elem_info.set_property('access', access)
    elem_info.set_property('value-count', VALUE_COUNT)

    consumption = 0
    iteration = 0
    added_elems = []
    while True:
        name = 'test-{}'.format(iteration)

        elem_id = ALSACtl.ElemId.new_by_name(ALSACtl.ElemIfaceType.MIXER,
                                             0, 0, name, 0)
        try:
            elem_id_list = card.add_elems(elem_id, elem_count, elem_info)
            added_elems.extend(elem_id_list)
            card.write_elem_tlv(elem_id_list[0], tlv_cntr)
            consumption += user_elem_size(
                    elem_count,
                    label_consumption,
                    tlv_consumption)
            iteration += 1
        except Exception as e:
            groups = match('ioctl\\(.+\\) ([0-9]+)\\(.+\\)', e.message)
            if groups is None or int(groups[1]) != 12:
                print('unexpected error',
                      iteration, len(added_elems), consumption, curr_cap)
            elif iteration != expected_iteration:
                print('unexpected iteration {} but expected {}, {}'.format(
                      iteration, expected_iteration, consumption))
            break

    print('expected_iteration: {}, iteration: {}, consumption {}'.format(
        expected_iteration, iteration, consumption))

    for elem_id in added_elems:
        try:
            card.remove_elems(elem_id)
        except Exception:
            pass


for i in range(1, 20):
    test_allocation(card, i, curr_cap)
```

The parameter is configured to 12551 and 12552 for boundary check. As a
result:

```
current value of max_user_ctl_alloc_size: 12552
expected_iteration: 11, iteration: 11, consumption 11627
expected_iteration: 8, iteration: 8, consumption 12552
...

current value of max_user_ctl_alloc_size: 12551
expected_iteration: 11, iteration: 11, consumption 11627
expected_iteration: 7, iteration: 7, consumption 10983
...
```

It looks well.


Regards

[1] https://mailman.alsa-project.org/pipermail/alsa-devel/2021-January/179683.html
[2] https://github.com/alsa-project/alsa-gobject/

Takashi Sakamoto
