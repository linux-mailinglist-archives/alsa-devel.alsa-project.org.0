Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F6338A082
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 11:00:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C07A1679;
	Thu, 20 May 2021 10:59:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C07A1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621501208;
	bh=LSMSA17klOoPISLo06GF+EQb8Synjn68aHt+7FzQVd0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZSNZOGcWhFaSW1DgN57Gdf5eY52dD63xIJEfWlHp+HXnE0SF2rXu6oyDCaG/i5IJW
	 lG2oy57a2AVTsZ22HRpHD/Fi3bkXjapz2tH20XsvqQF5LZVL6LW9eEpChJDqKWDlM3
	 HCmJA/IuA5oUu3moZ3hQBa9Bfd9sIgLCVUGFmt2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D69FDF8020B;
	Thu, 20 May 2021 10:58:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA242F80217; Thu, 20 May 2021 10:58:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83BB1F800C1
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 10:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83BB1F800C1
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <colin.king@canonical.com>)
 id 1ljeVZ-0003n1-Sr; Thu, 20 May 2021 08:58:21 +0000
From: Colin Ian King <colin.king@canonical.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: re: ALSA: usb-audio: Handle error for the current selector gracefully
 [ uninitialized variable issue ]
Message-ID: <4b261d68-f53f-240d-2d8a-2f88b337849d@canonical.com>
Date: Thu, 20 May 2021 09:58:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Static analysis with Coverity on linux-next has detected an
uninitialized variable issue with the following commit:

commit 481f17c41803985446fd12887b2c042f9c43b0d5
Author: Takashi Iwai <tiwai@suse.de>
Date:   Tue May 18 17:21:12 2021 +0200

    ALSA: usb-audio: Handle error for the current selector gracefully

The branching is a bit convoluted and we end up with variable cur not
being initialized. Analysis is as follows:

254static int __uac_clock_find_source(struct snd_usb_audio *chip,
255                                   const struct audioformat *fmt, int
entity_id,
256                                   unsigned long *visited, bool validate)
257{
258        union uac23_clock_source_desc *source;
259        union uac23_clock_selector_desc *selector;
260        union uac23_clock_multiplier_desc *multiplier;

   1. var_decl: Declaring variable cur without initializer.

261        int ret, i, cur, err, pins, clock_id;
262        const u8 *sources;
263        int proto = fmt->protocol;
264
265        entity_id &= 0xff;
266

   2. Condition test_and_set_bit(entity_id, visited), taking false
branch.

267        if (test_and_set_bit(entity_id, visited)) {
268                usb_audio_warn(chip,
269                         "%s(): recursive clock topology detected, id
%d.\n",
270                         __func__, entity_id);
271                return -EINVAL;
272        }
273
274        /* first, see if the ID we're looking for is a clock source
already */
275        source = snd_usb_find_clock_source(chip, entity_id, proto);

   3. Condition source, taking false branch.

276        if (source) {
277                entity_id = GET_VAL(source, proto, bClockID);
278                if (validate && !uac_clock_source_is_valid(chip, fmt,
279
entity_id)) {
280                        usb_audio_err(chip,
281                                "clock source %d is not valid, cannot
use\n",
282                                entity_id);
283                        return -ENXIO;
284                }
285                return entity_id;
286        }
287
288        selector = snd_usb_find_clock_selector(chip, entity_id, proto);

   4. Condition selector, taking true branch.
289        if (selector) {
   5. Condition proto == 48, taking true branch.
290                pins = GET_VAL(selector, proto, bNrInPins);
   6. Condition proto == 48, taking true branch.
291                clock_id = GET_VAL(selector, proto, bClockID);
   7. Condition proto == 48, taking true branch.
292                sources = GET_VAL(selector, proto, baCSourceID);
293
   8. Condition pins == 1, taking false branch.

294                if (pins == 1) {
295                        ret = 1;
296                        goto find_source;
297                }
298
299                /* the entity ID we are looking for is a selector.
300                 * find out what it currently selects */
301                ret = uac_clock_selector_get_val(chip, clock_id);

   9. Condition ret < 0, taking true branch.

302                if (ret < 0) {

   10. Condition !chip->autoclock, taking false branch.

303                        if (!chip->autoclock)
304                                return ret;

   11. Jumping to label find_others.

305                        goto find_others;
306                }
307
308                /* Selector values are one-based */
309
310                if (ret > pins || ret < 1) {
311                        usb_audio_err(chip,
312                                "%s(): selector reported illegal
value, id %d, ret %d\n",
313                                __func__, clock_id, ret);
314
315                        if (!chip->autoclock)
316                                return -EINVAL;
317                        ret = 0;
318                        goto find_others;
319                }
320
321        find_source:
322                cur = ret;
323                ret = __uac_clock_find_source(chip, fmt,
324                                              sources[ret - 1],
325                                              visited, validate);
326                if (ret > 0) {
327                        err = uac_clock_selector_set_val(chip,
entity_id, cur);
328                        if (err < 0)
329                                return err;
330                }
331
332                if (!validate || ret > 0 || !chip->autoclock)
333                        return ret;
334
335        find_others:
336                /* The current clock source is invalid, try others. */
   12. Condition i <= pins, taking true branch.
337                for (i = 1; i <= pins; i++) {

Uninitialized scalar variable (UNINIT)

   13. uninit_use: Using uninitialized value cur.

338                        if (i == cur)
339                                continue;
340

Colin
